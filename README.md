# makefile-templates

A collection of my commonly used makefile recipes.

# index

- [Dependencies](#dependencies)
- [Make Recipes](#make-recipes)
- [How to Release](#how-to-release)

# Dependencies

[back^](#index)

- [dprint](https://dprint.dev/)
- [lychee](https://lychee.cli.rs/)
- [shellcheck](https://www.shellcheck.net/)
- [shfmt](https://github.com/mvdan/sh)

# Make Recipes

[back^](#index)

```
bash-all               Run all bash tests
bash-check             Check format bash code
bash-deps              Install bash dependencies
bash-fmt               Format bash code
bash-lint              Check lint bash code
comments-tidy          Tidy comments within code
doc-changelog          Write CHANGELOG.md
doc-readme             Write README.md
dprint-check           Dprint check
dprint-fmt             Dprint format
go-audit               Audit go vulnerabilities
go-build               Build go binary
go-deps                Install go dependencies
go-fmt                 Format go code
go-lint                Lint go code
go-lint-fix            Fix lint go code
go-outdated            Display when go dependencies are out of date
go-run                 Run go app
go-tests               Run go tests
help                   Display this help screen
links-check            Check links
links-mirror           Mirror links
lua-check              Check format lua code
lua-fmt                Format Lua code
makefile-descriptions  Check if all Makefile rules have descriptions
rs-audit               Audit Cargo.lock
rs-audit-fix           Update Cargo.toml to fix vulnerable dependency requirement
rs-build               Build binary
rs-cargo-deps          Install cargo dependencies
rs-check               Run check
rs-dev                 Run check in watch mode
rs-doc                 Open app documentation
rs-fix                 Fix rust code
rs-fmt                 Format rust code
rs-fmt-fix             Format fix rust code
rs-install             Install binary
rs-lint                Lint rust code
rs-lint-fix            Fix lint rust code
rs-outdated            Display when dependencies are out of date
rs-tests               Run tests
rs-uninstall           Uninstall binary
rs-update-cargo        Update dependencies
rs-update-rustup       Update rust
typos                  Check typos
typos-fix              Fix typos
```

# How to Release

[back^](#index)

To generate a new version, you need to follow these steps:

1. Run the command `git tag -a <your.new.version> -m "version <your.new.version>"`.
2. Run the command `make doc-changelog && make doc-readme`.
3. Run the command `git add -A && git commit -m "release: <your.new.version>"`.
4. Run `git push` to `main`.
