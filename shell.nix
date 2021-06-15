{ pkgs ? import <nixpkgs> {}}:
let
    dhall-terraform-libgen = import (
        pkgs.fetchFromGitHub {
            owner = "emattiza";
            repo = "dhall-terraform";
            rev = "d6fb3d8bc6100582567157e00297da88855b71fa";
            sha256 = "1vmll5a00wl3zfr0dk6gv327qla1kf1jb0hjkpb316629a21d2ph";
        }
    ) {
      nixpkgs = pkgs;
    };
    terraform_1_0 = pkgs.terraform_0_15.overrideAttrs (old: rec {
        version = "v1.0.0";
        src = pkgs.fetchFromGitHub {
            owner = "hashicorp";
            repo = "terraform";
            rev = "v1.0.0";
            sha256 = "1yhkj8nqkciwka6y9ddczm5dygbhh8gq4mr82x55m7whipy17mvm";
        };
    });
in
pkgs.mkShell {
    buildInputs = with pkgs; [
         jq
         terraform_1_0
         dhall
         dhall-json
         dhall-terraform-libgen
        ];
}
