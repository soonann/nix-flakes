{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      fhs = pkgs.buildFHSUserEnv {
        name = "fhs-shell";
        targetPkgs = pkgs: [
          pkgs.python311
        ];
        LD_LIBRARY_PATH = "${stdenv.cc.cc.lib}/lib";
      };
    in
    {
      devShells.${system}.default = fhs.env;
    };
}
