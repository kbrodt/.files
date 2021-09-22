# Dotfiles

After clonning this repo, run `install` to set up the development environment.

## Requirements

- Install dependencies for [neovim](https://github.com/neovim/neovim).

## Software

### Keyboard-based

- [text editor `neovim`](https://neovim.io/)
- [media player `mpv`](https://mpv.io/)
- [document viewer `zathura`](https://pwmt.org/projects/zathura/)
- [image viewer `sxiv`](https://github.com/muennich/sxiv)
- [3D viewer `f3d`](https://kitware.github.io/F3D)
- [password manager `pass`](https://www.passwordstore.org/)
- [document and bibliography manager `papis`](https://github.com/papis/papis)
- [TODO list manager `taskwarrior`](https://taskwarrior.org/)
- [mail reader `neomutt`](https://neomutt.org/)
- [sophisticated calendar and alarm `remind`](https://dianne.skoll.ca/projects/remind/)

#### Not tested

- [music player `cmus`](https://cmus.github.io/)
- music piracy `smloadr`
- [movies/tv piracy `stremio`](https://www.stremio.com/)
- [ebooks `foliate`](https://johnfactotum.github.io/foliate/)

### CLI

- [google translate cli `trans`](https://github.com/soimort/translate-shell/)
- [fast find `fd`](https://github.com/sharkdp/fd)
- [fast grep `ripgrep`](https://github.com/BurntSushi/ripgrep)
- [cli benchmarking `hyperfine`](https://github.com/sharkdp/hyperfine)
- [manage files on cloud storage `rclone`](https://rclone.org/)

### GUI

- [note-taken software `xournalpp`](https://xournalpp.github.io/)
- [office suite `libreoffice`](https://www.libreoffice.org/)
- [3D creation suite `blender`](https://www.blender.org/)
- [keyboard-focused browser `qutebrowser`](https://qutebrowser.org/)

### etc

- [copy and paste `xclip`](https://github.com/astrand/xclip)
- [keybindings `sxhkd`](https://github.com/baskerville/sxhkd)
- [music control `playerctl`](https://github.com/altdesktop/playerctl)
- [plugin to control with standard media keys `mpv-mpris`](https://github.com/hoyon/mpv-mpris)

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
curl -F "shorten=SOME_URL" http://0x0.st
```

## TODO

- [ ] [native nvim lsp](https://github.com/neovim/nvim-lspconfig)
- [ ] [nvim-compe](https://github.com/hrsh7th/nvim-compe)
- [ ] [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
