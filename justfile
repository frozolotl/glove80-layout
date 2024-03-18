default: build install

build:
	nix-build

install:
	udisksctl mount -b /dev/disk/by-label/GLV80LHBOOT
	cp result/glove80.uf2 /run/media/$USER/GLV80LHBOOT/CURRENT.UF2
	udisksctl mount -b /dev/disk/by-label/GLV80RHBOOT
	cp result/glove80.uf2 /run/media/$USER/GLV80RHBOOT/CURRENT.UF2
