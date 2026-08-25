---
name: update-libssh2-openssl
description: >
  This skill updates the libssh2 and OpenSSL libraries to the latest versions available.
---

## When to use

- A new minor or patch version of libssh2 or OpenSSL has been released.

## When not to use

- A new major version of libssh2 or OpenSSL has been released, as this may introduce breaking changes. You can validate this by comparing the current version from the key files with the version provided by the user. If the major version has changed, report that the update cannot be performed and ask the user to manually update the libraries.

## Key files

- `<repo_root>/CMakeLists.txt` - The main CMake configuration file that specifies the default versions of libssh2 and OpenSSL to use.
- `<repo_root>/build.sh` - The build script that compiles the project and links against pre-defined versions of libssh2 and OpenSSL.
- `<repo_root>/azure-pipelines.yml` - The Azure Pipelines configuration file that defines the CI/CD pipeline, including the versions of libssh2 and OpenSSL to use during the build process.

## Inputs

The user provides one or more of the following inputs:

- **libssh2 version**: The desired version of libssh2 to update to (e.g., `1.11.2`).
- **OpenSSL version**: The desired version of OpenSSL to update to (e.g., `4.0.2`).

If the user provides only one of the two inputs, the skill will update only that library while leaving the other library at its current version.

## Process

### 1. Validate Inputs

Before making any changes, validate the user-provided versions. Versions must match the format `X.Y.Z` where `X`, `Y`, and `Z` are non-negative integers. If the user-provided version does not match this format, prompt the user to provide a valid version.

Read the corresponding release commit hashes for the specified versions of libssh2 and OpenSSL from their respective official repositories:

- [OpenSSL GitHub repository](https://github.com/openssl/openssl)
- [libssh2 GitHub repository](https://github.com/libssh2/libssh2)

Use the commit hash of the tag named `libssh2-<version>` or `openssl-<version>` and use it for the `<hash>` placeholders below. If the user-provided version does not exist as a GitHub release, prompt the user to provide a new version.

For libssh2, also read the official release package (`libssh2-<version>.tar.gz`) and the corresponding key file (`libssh2-<version>.tar.gz.asc`) from the [libssh2 website](https://www.libssh2.org/).

### 2. Update Key Files

Check the current versions and tags of libssh2 and OpenSSL specified in the key files (`CMakeLists.txt`, `build.sh`, and `azure-pipelines.yml`).

In `CMakeLists.txt`, update:
- `LIBSSH2_URL "https://libssh2.org/download/libssh2-<version>.tar.gz"`
- `LIBSSH2_URL_SIG "https://libssh2.org/download/libssh2-<version>.tar.gz.asc"`
- `LIBSSH2_COMMIT_HASH "<hash>"`
- `OPENSSL_COMMIT_HASH "<hash>"`

In `build.sh`, update:
- `-DLIBSSH2_URL=https://libssh2.org/download/libssh2-<version>.tar.gz`
- `-DLIBSSH2_URL_SIG=https://libssh2.org/download/libssh2-<version>.tar.gz.asc`
- `-DLIBSSH2_COMMIT_HASH=<hash>`
- `-DOPENSSL_COMMIT_HASH=<hash>`

In `azure-pipelines.yml`, update:
- `libssh2.version: '<version>'`
- `libssh2.commit: '<hash>'`
- `openssl.version: '<version>'`
- `openssl.commit: '<hash>'`

Compare the current versions with the user-provided versions.

If the user-provided version is newer than the current version, update the corresponding key files to reflect the new version.

### 3. Build

Run the build script (`build.sh`) to ensure that the project compiles successfully with the updated libraries. The script returns a non-zero exit code if the build fails, in which case the skill should report the failure and stop further execution.

### 4. Commit

If the build is successful, commit the changes using dedicated branches (e.g., `libssh2-1.11.2` and `openssl-4.0.2`).

The commit message should follow the format:

- Header: Mention the library being updated and the version change, e.g., `Update libssh2 from <current_version> to <new_version>` or `Update OpenSSL from <current_version> to <new_version>`.
- Body: Include a link to the official GitHub release notes for the new version.

The commit message should look like this:

```
Update OpenSSL from <current_version> to <new_version>

https://github.com/openssl/openssl/releases/tag/openssl-<new_version>
```

### 5. Pull Request

Push the changes to the remote repository and create a pull request.
