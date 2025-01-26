default: build install-left install-right draw

build:
    nix --experimental-features 'nix-command flakes' build

install: install-left install-right
install-left:
    udisksctl mount -b /dev/disk/by-label/GLV80LHBOOT
    cp result/glove80.uf2 /run/media/$USER/GLV80LHBOOT/CURRENT.UF2
install-right:
    udisksctl mount -b /dev/disk/by-label/GLV80RHBOOT
    cp result/glove80.uf2 /run/media/$USER/GLV80RHBOOT/CURRENT.UF2

draw:
    keymap draw assets/keymap.yaml | rsvg-convert -o assets/keymap.png -b '#1a202c' -d 192 -p 192 -

