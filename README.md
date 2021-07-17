# Dotfiles

After clonning this repo, run `install` to set up the development environment.

## Requirements

- Install dependencies for [neovim](https://github.com/neovim/neovim).

## Tools

- [fast find `fd`](https://github.com/sharkdp/fd)
- [fast grep `ripgrep`](https://github.com/BurntSushi/ripgrep)
- [cli benchmarking `hyperfine`](https://github.com/sharkdp/hyperfine)
- [document viewer `zathura`](https://pwmt.org/projects/zathura/)
- [image viewer `sxiv`](https://github.com/muennich/sxiv)
- [google translate cli `trans`](https://github.com/soimort/translate-shell/)
- [music player `cmus`](https://cmus.github.io/)
- music piracy `smloadr`
- [movies/tv piracy `stremio`](https://www.stremio.com/)
- [ebooks `foliate`](https://johnfactotum.github.io/foliate/)

## Useful cli

### IP info

```bash
curl ipinfo.io
```

### Weather

```bash
curl wttr.in/CITY
```

### File hosting

```bash
curl -F "file=@SOME_FILE" http://0x0.st
curl -F "shorten=SOME_FILE" http://0x0.st
```

## TODO

- [ ] [native nvim lsp](https://github.com/neovim/nvim-lspconfig)
- [ ] [nvim-compe](https://github.com/hrsh7th/nvim-compe)
- [ ] [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
