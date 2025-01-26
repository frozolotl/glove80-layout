{
  description = "frozolotl's glove80 keyboard layout";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    firmware = {
      url = "github:moergo-sc/zmk/v25.01";
      flake = false;
    };
    flake-parts.url = "github:hercules-ci/flake-parts";
    systems.url = "github:nix-systems/default";
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import inputs.systems;

      perSystem =
        { pkgs, ... }:
        let
          firmware = pkgs.callPackage inputs.firmware { };
        in
        {
          packages.default =
            let
              glove80Left = firmware.zmk.override {
                board = "glove80_lh";
                keymap = ./glove80.keymap;
                kconfig = ./glove80.conf;
              };
              glove80Right = firmware.zmk.override {
                board = "glove80_rh";
                keymap = ./glove80.keymap;
                kconfig = ./glove80.conf;
              };
            in
            firmware.combine_uf2 glove80Left glove80Right "glove80";
        };
    };
}
