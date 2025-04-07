# kotlin-sdk-example
Based on https://antithesis.com/docs/using_antithesis/sdk/java/example/?sid=85141.0&sterm=java%20sdk

Used nix flake for maven, jdk, and kotlin

### Use:
1) nix develop --extra-experimental-features flakes
2) mvn clean install
3) export ANTITHESIS_SDK_LOCAL_OUTPUT=assertions.json
4) mvn exec:java -Dexec.mainClass="AppKt"

