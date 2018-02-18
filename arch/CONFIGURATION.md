German keyboard:
```
setxkbmap -layout de -variant ,latin1^C
```

Activate pulseaudio:
```
systemctl --user enable pulseaudio.service
systemctl --user start pulseaudio.service
```

if pulseaudio is too loud:
change:
```
### Automatically load driver modules depending on the hardware available
.ifexists module-udev-detect.so
load-module module-udev-detect
.else
### Use the static hardware detection module (for systems that lack udev support)
load-module module-detect
.endif
```
to:
```
### Automatically load driver modules depending on the hardware available
.ifexists module-udev-detect.so
load-module module-udev-detect ignore_dB=1 tsched=0
.else
### Use the static hardware detection module (for systems that lack udev support)
load-module module-detect
.endif
```

local time:
```
sudo timedatectl set-ntp true
```

nvim:
install `vim-dein-git` and copy the .config/nvim folder to $HOME
install `python-neovim python-sexpdata python-websocket-client`
install `fzf`

## DNS
Prevent `dhcpcd` and `NetworkManager` from overwriting the conf.
Append the following to `/etc/NetworkManager/NetworkManager.conf`:

```
[main]
dns=none
```

and `nohook resolv.conf` to `/etc/dhcpcd.conf`.
