![Screenshots](screenshots.png)

# Details

Category        | Value
---             | ---
Distro          | [Arch Linux](https://archlinux.org/)
Wallpaper       | [here](.local/share/backgrounds)
Colorscheme     | [gruvbox-material-dark](https://github.com/sainnhe/gruvbox-material)
Fonts           | [Iosevka Nerd Font](https://www.nerdfonts.com/), [Roboto](https://material.google.com/style/typography.html) and [Noto emojis](https://fonts.google.com/noto)
WM              | [Hyprland](https://hyprland.org/)
Status bar      | [waybar](https://github.com/Alexays/Waybar/)
Notifications   | [mako](https://mako-project.org)
Launcher        | [rofi-wayland](https://github.com/lbonn/rofi)
Terminal        | [foot](https://codeberg.org/dnkl/foot)
Shell           | [zsh](https://www.zsh.org/) with [starship](https://starship.rs/)
Text editor     | [neovim](https://neovim.io/)
File manager    | [lf](https://github.com/gokcehan/lf)
Music player    | [cmus](https://cmus.github.io/)
Feed reader     | [newsraft](https://codeberg.org/newsraft/newsraft)
Web Browser     | [firefox](https://www.mozilla.org/firefox/)
Image Viewer    | [nsxiv](https://github.com/nsxiv/nsxiv)
Media Player    | [mpv](https://mpv.io/)
Document Viewer | [zathura](https://pwmt.org/projects/zathura/) with [mupdf backend](https://pwmt.org/projects/zathura-pdf-mupdf/)

# Installation

```sh
git clone --bare https://github.com/newmanls/dotfiles "${HOME}/.dotfiles"
alias dots='/usr/bin/git --git-dir="${HOME}/.dotfiles" --work-tree="$HOME"'
dots config --local status.showUntrackedFiles no
dots checkout
```
