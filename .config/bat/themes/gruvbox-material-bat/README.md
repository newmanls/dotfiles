## Gruvbox Material

This theme is a port of [Gruvbox Material](https://github.com/gruvbox-material/gruvbox-material) for [bat](https://github.com/sharkdp/bat) and everything that
supports `.tmTheme`.


## Installation to bat

Up-to-date description can be found [here](https://github.com/sharkdp/bat?tab=readme-ov-file#adding-new-themes).

```bash
mkdir -p "$(bat --config-dir)/themes"
cd "$(bat --config-dir)/themes"

# Download a theme in '.tmTheme' format, for example:
git clone https://github.com/molchalin/gruvbox-material-bat

# Update the binary cache
bat cache --build

# Check the full list of available themes.
bat --list-themes
```


## Related Projects

See this [wiki page](https://github.com/sainnhe/gruvbox-material/wiki/Related-Projects).

## Credits

- The color palette is based on [gruvbox](https://github.com/morhetz/gruvbox) by [@morhetz](https://github.com/morhetz)
- The color palette is adjusted by [@sainnhe](https://github.com/sainnhe)
- The files were generated using [code-theme-converter](https://github.com/tobiastimm/code-theme-converter) by [@tobiastimm](https://github.com/tobiastimm) from [gruvbox-material-vscode](https://github.com/sainnhe/gruvbox-material-vscode) by [@sainnhe](https://github.com/sainnhe)

## License

[MIT](https://en.wikipedia.org/wiki/MIT_License)
