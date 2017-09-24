if [ `type -P xcalib` ]; then
    # Use the color profile
    xcalib .colorprofiles/Display-8D79CBC9-A4EC-DDE1-12FC-91BA625B13C2.icc
fi;

if [ `type -P xbindkeys` ]; then
    # Load custom keyboard key bindings
    xbindkeys
fi;

exec i3
