# Release Instructions

Follow these instructions to publish a new release.

## Release Preparation

### On GitHub

- Draft the release notes

### On Windows

- Open `lvssh2.cdx.json`
    - Bump the release version of lvssh2
        - `metadata.component.version`
        - `metadata.component.purl`
- Run `rm -rf build/` (needed because VIPM otherwise scans the tree)
- Open `lvssh2.vipb`
    - Bump release version
    - Update release notes
    - (Optional) Bump copyright year
- (Optional) Bump copyright year in `LICENSE.txt`
- Commit the changes to a dedicated release branch
- Open a release PR
- Merge the PR

## Release

### On Linux

- Make sure the latest source version is checked out
- Run `git clean -xdf` to clear any uncommitted files
- Run `sudo chmod +x build.sh`
- Run `./build.sh`
- Copy *.so files from `./libssh2/` to Windows

### On Windows

- Make sure the latest source version is checked out
- Run `git clean -xdf` to clear any uncommitted files
- Run `./build.sh`
- Paste the *.so files from Linux

### On GitHub

- Add `pnr_lib_lvssh2-<version>.vip` to the release
- Add `lvssh2.cdx.json` as `pnr_lib_lvssh2-<version>.vip.cdx.json` to the release