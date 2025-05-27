--- obsidian-sync.lua ---
-- This module provides Git automation for an Obsidian vault within Neovim.
-- It integrates automatic Git pull operations when opening files in the vault,
-- automatic Git add/commit/push operations when saving files in the vault,
-- and a user-callable command for manual synchronization.
-- It leverages 'plenary.job' for asynchronous Git command execution.
-- Based on https://github.com/ViViDboarder/vim-settings/blob/23cf5fc1feabcc1baf66a622ffb869117b51e50f/neovim/lua/plugins/obsidian.lua

local M = {}

--- @type string
-- Stores the absolute, expanded file system path to the Obsidian vault.
-- This path is crucial for all Git operations and file pattern matching.
-- It is initialized by the `M.setup()` function.
M.vault_path = ""

--- Helper function to execute a Git command asynchronously.
-- It uses `plenary.job` to run shell commands without blocking Neovim.
-- Provides detailed notifications for debugging and user feedback.
--
-- @param command string The primary Git command (e.g., "git").
-- @param args table A list of string arguments to pass to the Git command (e.g., {"pull", "--rebase"}).
-- @param cwd string The current working directory (Current Working Directory) where the Git command should be executed.
--                   This *must* be an absolute and fully expanded path (e.g., "/home/user/Documents/Obsidian").
-- @param success_msg string The message to display as an INFO notification upon successful command execution.
-- @param error_msg string The base message to display as an ERROR notification if the command fails unexpectedly.
-- @param on_complete fun(success: boolean, result_lines: table, return_val: number) An optional callback function
--                      that is executed once the Git command finishes. It receives:
--                      - `success` (boolean): `true` if the command exited with code 0, or if its exit code was
--                                             listed in `ignore_error_codes`. `false` otherwise.
--                      - `result_lines` (table): A table of strings, where each string is a line of the command's
--                                                standard output.
--                      - `return_val` (number): The raw integer exit code of the executed command.
-- @param ignore_error_codes table|nil An optional list of integer exit codes that should *not* be treated as
--                                     fatal errors. For example, `{1}` for `git commit` when there are no
--                                     changes to commit. If `nil`, no error codes are ignored.
local run_git_command = function(command, args, cwd, success_msg, error_msg, on_complete, ignore_error_codes)
    ignore_error_codes = ignore_error_codes or {} -- Ensure it's a table even if nil is passed
    local Job = require("plenary.job")

    -- Log debug information about the command being executed
    vim.notify("Executing: git " .. table.concat(args, " "), vim.log.levels.DEBUG, { title = "Obsidian Sync Debug" })
    vim.notify("In directory: " .. cwd, vim.log.levels.DEBUG, { title = "Obsidian Sync Debug" })

    Job:new({
        command = "git",
        args = args,
        cwd = cwd, -- Set the working directory for the Git command
        on_exit = function(j, return_val)
            -- Check if the command's exit code is one that should be gracefully ignored
            local is_ignored_error = false
            for _, code in ipairs(ignore_error_codes) do
                if return_val == code then
                    is_ignored_error = true
                    break
                end
            end

            -- Provide user feedback based on the command's outcome
            if return_val == 0 or is_ignored_error then
                -- Only show a 'success_msg' if the command truly succeeded (exit code 0).
                -- For ignored errors (like 'nothing to commit'), a more specific message
                -- is typically handled by the calling function.
                if return_val == 0 then
                    vim.notify(success_msg, vim.log.levels.INFO, { title = "Obsidian Sync" })
                end
            else
                -- Display an error message for unexpected failures
                vim.notify(
                    error_msg .. " " .. vim.inspect(j:result()), -- Include command output for debugging
                    vim.log.levels.ERROR,
                    { title = "Obsidian Sync" }
                )
            end

            -- Call the completion callback, indicating whether the operation was successful
            -- (including cases where errors were intentionally ignored).
            if on_complete then
                on_complete(return_val == 0 or is_ignored_error, j:result(), return_val)
            end
        end,
    }):start()
end

--- Performs a 'git pull' operation on the configured Obsidian vault.
-- This function is typically called when a file within the vault is opened,
-- or as the first step in a manual synchronization.
--
-- @param on_complete fun(success: boolean, result_lines: table, return_val: number) An optional callback function
--                      to execute after the pull operation finishes.
local do_pull = function(on_complete)
    vim.notify("Pulling Obsidian notes...", vim.log.levels.INFO, { title = "Obsidian Sync" })
    run_git_command(
        "git",
        { "pull" },
        M.vault_path, -- Execute pull in the vault directory
        "Obsidian notes pulled successfully.",
        "Failed to pull Obsidian notes.",
        on_complete
    )
end

--- Performs a sequence of Git operations: 'git add .', 'git commit', and 'git push'.
-- This function is designed to automatically stage all changes, commit them with a timestamped message,
-- and then push to the remote repository. It gracefully handles the scenario where there are no
-- changes to commit.
--
-- @param on_complete fun(success: boolean, result_lines: table, return_val: number) An optional callback function
--                      to execute after the entire commit/push sequence finishes.
local do_commit_and_push = function(on_complete)
    local date_string = os.date("%Y-%m-%d %H:%M:%S")

    -- Step 1: Git Add (stage all changes in the working directory)
    vim.notify("Adding changes...", vim.log.levels.INFO, { title = "Obsidian Sync" })
    run_git_command(
        "git",
        { "add", "." }, -- Add all modified, new, and deleted files
        M.vault_path,   -- Execute 'git add' in the vault directory
        "Changes added to staging.",
        "Failed to add changes to staging.",
        function(add_success, add_result, add_return_val)
            if not add_success then
                -- If 'git add' failed, stop the sequence and notify.
                if on_complete then on_complete(false) end
                return
            end

            -- Step 2: Git Commit
            vim.notify("Committing changes...", vim.log.levels.INFO, { title = "Obsidian Sync" })
            -- 'git commit' returns exit code 1 if there's nothing to commit. We explicitly ignore this code
            -- to prevent it from being treated as a general error, allowing for a custom message.
            run_git_command(
                "git",
                { "commit", "-m", "vault backup: " .. date_string }, -- Changed commit message here
                M.vault_path, -- Execute 'git commit' in the vault directory
                "Changes committed.",
                "Failed to commit changes.",
                function(commit_success, commit_result, commit_return_val)
                    if commit_return_val == 1 then -- Specific check for "nothing to commit"
                        vim.notify("No changes to commit.", vim.log.levels.INFO, { title = "Obsidian Sync" })
                        -- Treat this as a successful step for the overall sequence, as no action was needed.
                        if on_complete then on_complete(true, commit_result, commit_return_val) end
                        return
                    end
                    if not commit_success then
                        -- If 'git commit' failed for reasons other than 'nothing to commit', stop.
                        if on_complete then on_complete(false) end
                        return
                    end

                    -- Step 3: Git Push
                    vim.notify("Pushing changes...", vim.log.levels.INFO, { title = "Obsidian Sync" })
                    run_git_command(
                        "git",
                        { "push" },
                        M.vault_path, -- Execute 'git push' in the vault directory
                        "Changes pushed to remote.",
                        "Failed to push notes.",
                        on_complete -- Pass the final completion callback
                    )
                end,
                {1} -- Instruct run_git_command to ignore exit code 1 for 'git commit'
            )
        end
    )
end

--- Initiates a full manual synchronization of the Obsidian vault.
-- This function first pulls changes from the remote, then adds, commits, and pushes
-- any local changes. It provides comprehensive notifications throughout the process.
-- This is the function executed when the `:ObsidianSync` user command is called.
M.sync_vault = function()
    -- Start by pulling remote changes
    do_pull(function(pull_success)
        if pull_success then
            -- If pull was successful, proceed to commit and push local changes
            do_commit_and_push(function(push_success, _, commit_return_val)
                -- The overall sync is considered complete if push succeeded, or if
                -- there were no changes to commit (commit_return_val == 1).
                if push_success or (commit_return_val == 1) then
                    vim.notify("Obsidian vault sync complete!", vim.log.levels.INFO, { title = "Obsidian Sync" })
                else
                    -- If push failed, or commit failed for an unexpected reason
                    vim.notify("Obsidian vault sync failed during push phase.", vim.log.levels.ERROR, { title = "Obsidian Sync" })
                end
            end)
        else
            -- If pull failed, the sync stops here.
            vim.notify("Obsidian vault sync failed during pull phase.", vim.log.levels.ERROR, { title = "Obsidian Sync" })
        end
    end)
end

--- Sets up automatic Git synchronization autocommands.
-- This function creates Neovim autocommands that trigger Git operations
-- automatically based on file events within the Obsidian vault.
--
-- - `BufRead`, `BufNewFile`: Triggers a `git pull` when a file in the vault is opened or newly created.
-- - `BufWritePost`: Triggers a `git add`, `git commit`, and `git push` when a file in the vault is saved.
function M.auto_git()
    -- Create an autocommand group to manage these specific autocommands, allowing for easy clearing.
    local group_id = vim.api.nvim_create_augroup("obsidian-git", { clear = true })

    -- Autocommand for automatic pull on opening or creating a file in the vault.
    vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        pattern = M.vault_path .. "/**", -- Match any file within the vault and its subdirectories
        callback = function() do_pull() end, -- Execute the pull operation
        group = group_id,
    })

    -- Autocommand for automatic commit and push on saving a file in the vault.
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        pattern = M.vault_path .. "/**", -- Match any file within the vault and its subdirectories
        callback = function() do_commit_and_push() end, -- Execute the commit and push sequence
        group = group_id,
    })
end

--- Configures the Obsidian Git automation module.
-- This is the primary entry point for setting up the plugin from your Neovim configuration.
-- It expects a table of options, which should include the `vault_path`.
--
-- @param opts table A table containing configuration options for the plugin.
--                   @field opts.vault_path string The path to your Obsidian vault. This path can contain a tilde (`~`)
--                                                 for the home directory, as it will be expanded internally.
function M.setup(opts)
    opts = opts or {} -- Ensure opts is a table even if nil is passed

    -- Validate that vault_path is provided
    if not opts.vault_path then
        vim.notify(
            "Obsidian Sync: 'vault_path' is required in setup options.",
            vim.log.levels.ERROR,
            { title = "Obsidian Sync Error" }
        )
        return
    end

    -- IMPORTANT: Expand the vault_path to an absolute path before storing it.
    -- `plenary.job` requires absolute paths for its `cwd` option.
    M.vault_path = vim.fn.expand(opts.vault_path)

    -- Set up the automatic autocommands for pull on open and commit/push on save.
    M.auto_git()

    -- Create a user command accessible from Neovim's command line (e.g., `:ObsidianSync`).
    vim.api.nvim_create_user_command(
        'ObsidianSync', -- The name of the new Neovim command
        M.sync_vault,   -- The Lua function to execute when the command is called
        {
            desc = 'Sync Obsidian vault (pull & push Git changes)', -- Description for `:h :ObsidianSync` and command completion
            nargs = 0, -- Specifies that this command takes no arguments
        }
    )
end

return M
