{
  description = "Antithesis Kotlin SDK Example";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            jdk17  # or jdk21 if you want newer
            maven
            kotlin
          ];

          JAVA_HOME = "${pkgs.jdk17}"; 
          #JAVA_HOME = "${pkgs.jdk17}/lib/openjdk";
        };
      });
}
