{
  description = "Kotlin + Maven in a dev environment";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

  outputs = { self, nixpkgs }: {
    devShells.default = nixpkgs.lib.mkShell {
      buildInputs = with nixpkgs.legacyPackages.${builtins.currentSystem}; [
        openjdk21        # or openjdk17 if you prefer
        maven
        kotlin            # Add Kotlin to the devShell environment
      ];

      shellHook = ''
        export JAVA_HOME=${nixpkgs.legacyPackages.${builtins.currentSystem}.openjdk21}
        export KOTLIN_HOME=${nixpkgs.legacyPackages.${builtins.currentSystem}.kotlin}
        echo "Dev shell ready with Java, Maven, and Kotlin"
      '';
    };
  };
}
