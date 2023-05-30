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
- [3D viewer `f3d`](https://f3d-app.github.io/f3d/)
- [password manager `pass`](https://www.passwordstore.org/)
- [document and bibliography manager `papis`](https://github.com/papis/papis)
- [TODO list manager `taskwarrior`](https://taskwarrior.org/)
- [mail reader `neomutt`](https://neomutt.org/)
- [sophisticated calendar and alarm `remind`](https://dianne.skoll.ca/projects/remind/)
- [`vcal` parser for {V,I}Calendar](https://waynemorrison.com/software/vcal)
- [keyboard-focused browser `qutebrowser`](https://qutebrowser.org/)
- [RSS feed reader `newsboat`](https://newsboat.org/)
- [`profanity` XMPP client](https://profanity-im.github.io/)
- [`dunst` lightweight notification daemon](https://dunst-project.org/)
- [`tmate` instant terminal sharing](https://tmate.io/)

### CLI

- [google translate cli `trans`](https://github.com/soimort/translate-shell/)
- [fast find `fd`](https://github.com/sharkdp/fd)
- [fast grep `ripgrep`](https://github.com/BurntSushi/ripgrep)
- [cli benchmarking `hyperfine`](https://github.com/sharkdp/hyperfine)
- [manage files on cloud storage `rclone`](https://rclone.org/)
- [`isync`: free IMAP and MailDir mailbox synchronizer](https://isync.sourceforge.io/)
- [`videogrep` searches through dialog in video](https://antiboredom.github.io/videogrep/)
- [`rdrview` tool to extract the main content from a webpage](https://github.com/eafer/rdrview)
- [`jq` json processor](https://stedolan.github.io/jq/)
- [`pup` html processor](https://github.com/ericchiang/pup)
- [`lsix` ls for images in terminal](https://github.com/hackerb9/lsix)
- [`vv` image viewer for terminals](https://github.com/hackerb9/vv)
- [`woof` web offer one file share](http://www.home.unix-ag.org/simon/woof.html)

### GUI

- [note-taken software `xournalpp`](https://xournalpp.github.io/)
- [office suite `libreoffice`](https://www.libreoffice.org/)
- [3D creation suite `blender`](https://www.blender.org/)
- [Desktop app `jitsi meet`](https://github.com/jitsi/jitsi-meet-electron)
- [Vector graphics editor `inkscape`](https://inkscape.org/)
- [Image editor `gimp`](https://www.gimp.org/)
- [`dragon` drag-on-drop source/sink](https://github.com/mwh/dragon)

### etc

- [copy and paste `xclip`](https://github.com/astrand/xclip)
- [keybindings `sxhkd`](https://github.com/baskerville/sxhkd)
- [music control `playerctl`](https://github.com/altdesktop/playerctl)
- [plugin to control mpv with standard functional media keys `mpv-mpris`](https://github.com/hoyon/mpv-mpris)
- [`barrier` share keyboard between multiple computers](https://github.com/debauchee/barrier)
- [`weylus` tablet into a graphic touch screen](https://github.com/H-M-H/Weylus)
- [`ventoy` bootable USB](https://www.ventoy.net/en/index.html)
- [`qemu` machine emulator](https://www.qemu.org/)
- [`czkawka` removes unnecessary files](https://github.com/qarmin/czkawka)
- [`screensy` screen sharing](https://github.com/screensy/screensy)
- [`tmpfiles` file sharing](https://tmpfiles.org/)
- [`kdeconnect` file sharing between devices](https://kdeconnect.kde.org/)

### server

- [proxy server `nginx`](https://nginx.org/en/)
- [nonprofit certificate authority `letsencrypt`](https://letsencrypt.org/)
- [hyperfast web frontend for git repos `cgit`](https://git.zx2c4.com/cgit/about/)
- [productivity platform `nextcloud`](https://nextcloud.com/)
- [video conferencing `jitsi`](https://jitsi.org/)
- [uncomplicated firewall `ufw`]()
- [`fail2ban`](https://www.fail2ban.org/wiki/index.php/Main_Page)
- [`prosody` a modern XMPP communication server](https://prosody.im/)
- [`mumble` voice chat application](https://www.mumble.info/)
- [`transfer.sh` easy and fast file sharing](https://github.com/dutchcoders/transfer.sh)
  - [How to self host server behind proxy](https://github.com/dutchcoders/transfer.sh/issues/458)
  - [`oshi.at`](https://github.com/somenonymous/OshiUpload)
- [`yt-local` browser-based client for watching Youtube](https://git.sr.ht/~heckyel/yt-local)
- [`syncthing` continuous file synchronization](https://syncthing.net/)
- [`gotify` server for sending and receiving messages](https://gotify.net/)
  - [cli client with `wscat`](https://github.com/gotify/server/issues/255)
- [`rtsp` server to publish live video streams](https://github.com/aler9/rtsp-simple-server)
- [`jeyllyfin` to control of media](https://jellyfin.org/)
- [`yakforms` forms](https://yakforms.org/)

#### Not tested

- [music player `cmus`](https://cmus.github.io/)
- music piracy `smloadr`
- [movies/tv piracy `stremio`](https://www.stremio.com/)
- [ebooks `foliate`](https://johnfactotum.github.io/foliate/)
- [entertainment system `kodi`](https://kodi.tv/)

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

## Games

- [RTS `0 A.D.`](https://play0ad.com/)
- [OpenRA](https://www.openra.net/)

## Wayland

- [`Hyprland` dynamic tiling compositor](https://hyprland.org/)
- [`waybar` bar](https://github.com/Alexays/Waybar)
- [`foot` terminal emulator](https://codeberg.org/dnkl/foot)
- ['wl-clipboard'](https://github.com/bugaevc/wl-clipboard)
- [`hyprpaper` wallpaper utility for Hyprland](https://github.com/hyprwm/hyprpaper)
- [`mpvpaper` animated wallpaper](https://github.com/GhostNaN/mpvpaper)
- [`swww` efficient animated wallpaper](https://github.com/Horus645/swww)

## F-Droid

- [`SshDaemon` transfer files to/from home](https://f-droid.org/en/packages/com.daemon.ssh/)
- [`Termux` terminal emulator](https://termux.dev/en/)
