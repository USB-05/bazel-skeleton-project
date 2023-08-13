Sample Bazel Project with functionality to generate the coverage in SonarQube server.

For Bzlmod the integrity for archive_override needs to be in cryptic format and to generate that use following command
```
shasum -b -a 256 <filename> | awk '{print $1}' | xxd -r -p | base64
```
Use the value in format in integrity tag: sha256-<Value got from above command>