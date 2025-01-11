# makefile-templates

A collection of my commonly used makefile recipes.

# index

  - [Dependencies](#dependencies)
  - [Make Recipes](#make-recipes)

# Dependencies

[back^](#index)

- [biome](https://biomejs.dev/)
- [ruff](https://docs.astral.sh/ruff/)
- [taplo](https://github.com/tamasfe/taplo)
- [yamlfmt](https://github.com/google/yamlfmt)
- [yamllint](https://github.com/adrienverge/yamllint)

# Make Recipes

[back^](#index)

```
bash-all                  Run all bash tests
bash-check                Check bash code
bash-deps                 Install bash dependencies
bash-fmt                  Format bash code
bash-lint                 Lint bash code
check-links               Check if links are not dead
doc-changelog             Autogenerate CHANGELOG.md
doc-readme                Write README.md
go-audit                  Audit go vulnerabilities
go-build                  Build go binary
go-deps                   Install go dependencies
go-fmt                    Format go code
go-lint                   Lint go code
go-lint-fix               Fix lint go code
go-outdated               Display when go dependencies are out of date
go-run                    Run go app
go-tests                  Run go tests
help                      Display this help screen
js-fmt                    Format javascript code
js-fmt-fix                Format fix javascript code
js-lint                   Lint javascript code
js-lint-fix               Fix lint javascript code
py-dev                    Check python code in watch mode
py-fmt                    Format python code
py-fmt-fix                Format fix python code
py-lint                   Lint python code
py-lint-fix               Fix lint python code
rs-audit                  Audit rust vulnerabilities
rs-audit-fix              Fix rust vulnerabilities
rs-bin-deps               Install cargo dependencies
rs-build                  Build rust binary
rs-check                  Check rust code
rs-dev                    Check rust code in watch mode
rs-fix                    Fix rust code
rs-fmt                    Check format of rust code
rs-fmt-fix                Format rust code
rs-install                Install rust binary
rs-lint                   Lint rust code
rs-lint-fix               Fix linting issues in rust code
rs-outdated               Display when rust dependencies are out of date
rs-tests                  Run rust tests
rs-uninstall              Uninstall rust binary
rs-update                 Update rust dependencies
rs-update-rustup          Update rustup
toml-fmt                  Format toml code
toml-lint                 Check toml yaml code
typos                     Check typos
typos-fix                 Fix typos
yaml-fmt                  Format yaml code
yaml-lint                 Check lint yaml code
```
