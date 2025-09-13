{
  description = "A multi-system flake to serve docs for the SCC compiler";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];

      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    in
    {
      devShells = forAllSystems (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = pkgs.mkShell {
            buildInputs = [
              pkgs.python3
              (pkgs.python3.withPackages (ps: [
                ps.mkdocs
                ps.mkdocs-material
              ]))
            ];

            shellHook = ''
              echo "Entered SCC MKDocs development environment."
              echo "Run 'mkdocs serve' to start the local server."

              # XXX: this only works for developers using zsh.
              #  Ideally, replace with an `exec $SHELL`
              export PATH=${pkgs.zsh}/bin:$PATH
              export SHELL=${pkgs.zsh}/bin/zsh
              exec ${pkgs.zsh}/bin/zsh --login
            '';
          };
        });
    };
}

