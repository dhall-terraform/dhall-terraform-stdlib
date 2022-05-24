{ pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
    buildInputs = with pkgs; [
         jq
         dhall
         dhall-json
         terraform
        ];
}
