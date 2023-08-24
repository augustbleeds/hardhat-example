{
    description = "hardhat-example";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        flake-utils.url = "github:numtide/flake-utils";
    };

    outputs = { self, flake-utils, nixpkgs }: 
        flake-utils.lib.eachDefaultSystem (system: 
            let
                pkgs = import nixpkgs { inherit system; };        
            in {
                devShell = pkgs.mkShell {
                    buildInputs = with pkgs; [
                        nodejs-18_x
                        (yarn.override { nodejs = nodejs-18_x; })
                        nodePackages.typescript
                        nodePackages.typescript-language-server
                        nodePackages.npm
                    ];
                };
            }
        );
}