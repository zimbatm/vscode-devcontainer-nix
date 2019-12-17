let
  pkgs = import <nixpkgs> {};
in
  pkgs.runCommand "testing" {} ''
    echo ${toString builtins.currentTime} > $out
  ''
