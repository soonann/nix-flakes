{
  description = "cpp starter flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/22.11";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, ... }@inputs: inputs.utils.lib.eachSystem [
    "x86_64-linux"
    "i686-linux"
    "aarch64-linux"
    "x86_64-darwin"
  ]
    (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ ];
          config.allowUnfree = true;
        };
      in
      {
        devShells.default = pkgs.mkShell rec {
          name = "cpp-project";
          packages = with pkgs; [
            clang-tools
            llvmPackages_14.clang
            gnumake
          ];
          shellHook = ''
            export PS1="(flake) $PS1"
            #export CFLAGS="-g -std=c++20 -O3 -Wall -Wpedantic -Wconversion -pthread"
          '';
        };

      });
}

