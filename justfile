default: build install draw

build:
    nix-build

install:
    udisksctl mount -b /dev/disk/by-label/GLV80LHBOOT
    cp result/glove80.uf2 /run/media/$USER/GLV80LHBOOT/CURRENT.UF2
    udisksctl mount -b /dev/disk/by-label/GLV80RHBOOT
    cp result/glove80.uf2 /run/media/$USER/GLV80RHBOOT/CURRENT.UF2

draw:
    keymap draw assets/keymap.yaml | rsvg-convert -o assets/keymap.png -b '#1a202c' -

