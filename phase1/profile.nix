let
  nixpkgs = import ./nixpkgs.nix;

  pkgs = import nixpkgs { config = {}; overlays = []; };

  mkUserEnvironment = pkgs.callPackage ./user-environment.nix {};
in
mkUserEnvironment {
  derivations = with pkgs; [
    bashInteractive
    cacert
    coreutils
    gitMinimal
    gnutar
    gzip
    iana-etc
    nix
    shadow
    xz
  ];
}
