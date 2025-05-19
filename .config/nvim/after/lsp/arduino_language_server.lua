return {
    cmd = {
        'arduino-language-server',
        '-clangd'     , 'clangd',
        '-cli'        , '/usr/bin/arduino-cli',
        '-cli-config' , vim.fn.expand('~/.arduino15/arduino-cli.yaml'),
        '-fqbn'       , 'esp32-bluepad32:esp32:esp32',
    },
}
