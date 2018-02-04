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
