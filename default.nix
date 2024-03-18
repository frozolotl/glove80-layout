{ pkgs ? import <nixpkgs-stable> {} }:

let
  firmware = import (fetchTarball "https://github.com/moergo-sc/zmk/archive/master.tar.gz")
 {};
  config = ./.;

  glove80_left  = firmware.zmk.override { board = "glove80_lh"; keymap = "${config}/glove80.keymap"; kconfig = "${config}/glove80.conf"; };
  glove80_right = firmware.zmk.override { board = "glove80_rh"; keymap = "${config}/glove80.keymap"; kconfig = "${config}/glove80.conf"; };

in firmware.combine_uf2 glove80_left glove80_right
