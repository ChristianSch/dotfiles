## apps
* redshift-gtk (included in redshift)
* caffeine-ng
* polybar (aur)
* rofi
* nm-applet (included in network-manager-applet)
* termite
* i3-gaps (aur)
* `volnoti` (`volnoti-brightness-git` from `aur`)

## packages
* `i3-gaps`
* `ttf-droid`
* `i3-gaps` (aur)
* `termite`
* `redshift`
* `termite`
* `rofi` (aur)
* `polybar` (aur)
* `caffeine-ng` (aur)
* `xorg-xrandr`
* `compton`
* `feh`
* `dunst`
* `osx-arc-darker` (aur)
* `xorg-xrdb`
* `cower`
* `pavucontrol`
* `pasystray` (aur)
* `llpp` (aur) doc viewer
* `gummi` latex editor
* `gitg` git gui
* `pcmanfm`
* `xsel`
* `tmux`
* `lxappearance`
* `deepin-icon-theme`

(TBD)


## Music
I run `beets`+`mpd` with `alsa` and `pulseaudio`. You have to
run `mpd` and `pulseaudio` as user:

```
systemctl --user enable mpd.service
systemctl --user start mpd.service
```

The config goes in `.config/mpd/mpd.conf`.

Beets is configured to manage the music in `$HOME/Music/beets/music`, where
`mpd` is also configured to look for music. You add music to the queue by
running `mpd add $ALBUM/$SONG` where `$ALBUM` is a children folder
of `$HOME/Music/beets/music` and `$SONG` therefore is a file in that very folder.
You can also use `npmc` or `npmcpp`.

## Fonts
I use patched fonts for tmux and powerline stuff, see
[https://visual-assault.org/2016/03/05/install-encrypted-arch-linux-on-apple-macbook-pro/here](https://github.com/powerline/fonts).

## MacBook
See the macbook folder, as well as:
* https://visual-assault.org/2016/03/05/install-encrypted-arch-linux-on-apple-macbook-pro/
