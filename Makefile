#!make

help: ## Display this help screen
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; \
		{printf "%-25s %s\n", $$1, $$2}' | \
		sort

bash-all: bash-fmt bash-check bash-lint ## Run all bash tests

bash-check: ## Check bash code
	@find . -type f -name "*.sh" | xargs shfmt -i 2 -d

bash-fmt: ## Format bash code
	@find . -type f -name "*.sh" | xargs shfmt -i 2 -w

bash-lint: ## Lint bash code
	@find . -type f -name "*.sh" | xargs shellcheck -o all

check-links: ## Check if links are not dead
	@./dev/check-links.sh

doc-changelog: ## Autogenerate CHANGELOG.md
	@git-cliff --config cliff.toml --output CHANGELOG.md

doc-readme: ## Write README.md
	@./dev/doc-readme.sh

js-fmt: ## Format javascript code
	@npx @biomejs/biome format .

js-fmt-fix: ## Format fix javascript code
	@npx @biomejs/biome format --write .

js-lint: ## Lint javascript code
	@npx @biomejs/biome lint .

js-lint-fix: ## Fix lint javascript code
	@npx @biomejs/biome lint --apply .

py-dev: ## Check python code in watch mode
	@ruff check --watch

py-fmt: ## Format python code
	@ruff format --check --diff --verbose

py-fmt-fix: ## Format fix python code
	@ruff format

py-lint: ## Lint python code
	@ruff check --show-fixes --verbose

py-lint-fix: ## Fix lint python code
	@ruff check --fix

rs-audit: ## Audit dependencies
	@cargo audit

rs-audit-fix: ## Fix vulnerable dependencies requirements
	@cargo audit fix

rs-bin-deps: ## Install cargo dependencies
	@cargo install --locked cargo-outdated
	@cargo install cargo-audit --features=fix
	@cargo install cargo-udeps --locked
	@cargo install cargo-watch
	@cargo install eza
	@cargo install bat
	@cargo install ripgrep
	@cargo install sd
	@cargo install typos-cli
	@rustup component add clippy

rs-build: ## Build binary
	@cargo build --release --locked --frozen --bins

rs-check: ## Check rust code
	@cargo check

rs-dev: ## Check rust code in watch mode
	@cargo watch -c

rs-doc: ## Open app documentation
	@cargo doc --open

rs-fix: ## Fix rust code
	@cargo fix --allow-dirty --allow-staged --all-features --all-targets

rs-fmt: ## Check format of rust code
	@cargo fmt --all --check

rs-fmt-fix: ## Format rust code
	@cargo fmt --all

rs-install: ## Install binary
	@cargo install --path .

rs-lint: ## Lint rust code
	@cargo clippy --workspace --all-targets --all-features --no-deps -- -D warnings

rs-lint-fix: ## Fix linting issues in rust code
	@cargo clippy --workspace --all-targets --all-features --no-deps --allow-dirty --allow-staged --fix -- -D warnings

rs-outdated: ## Display when dependencies are out of date
	@cargo outdated -wR

rs-tests: ## Run tests
	@cargo test --lib

rs-uninstall: ## Uninstall binary
	@cargo uninstall

rs-update: ## Update dependencies
	@cargo update

rs-update-rustup: ## Update rustup
	@rustup update

toml-fmt: ## Format toml code
	@find . -type f -regex ".*.toml" | xargs taplo format

toml-lint: ## Check toml yaml code
	@find . -type f -regex ".*.toml" | xargs taplo lint

typos: ## Check typos
	@typos

typos-fix: ## Fix typos
	@typos -w

yaml-fmt: ## Format yaml code
	@find . -type f -regex ".*.ya?ml" | xargs yamlfmt

yaml-lint: ## Check lint yaml code
	@find . -type f -regex ".*.ya?ml" | xargs yamllint

.PHONY: help
.PHONY: bash-all
.PHONY: bash-check
.PHONY: bash-fmt
.PHONY: bash-lint
.PHONY: check-links
.PHONY: doc-changelog
.PHONY: doc-readme
.PHONY: js-fmt
.PHONY: js-fmt-fix
.PHONY: js-lint
.PHONY: js-lint-fix
.PHONY: py-dev
.PHONY: py-fmt
.PHONY: py-fmt-fix
.PHONY: py-lint
.PHONY: py-lint-fix
.PHONY: rs-audit
.PHONY: rs-audit-fix
.PHONY: rs-bin-deps
.PHONY: rs-build
.PHONY: rs-check
.PHONY: rs-dev
.PHONY: rs-doc
.PHONY: rs-fix
.PHONY: rs-fmt
.PHONY: rs-fmt-fix
.PHONY: rs-install
.PHONY: rs-lint
.PHONY: rs-lint-fix
.PHONY: rs-outdated
.PHONY: rs-tests
.PHONY: rs-uninstall
.PHONY: rs-update
.PHONY: rs-update-rustup
.PHONY: toml-fmt
.PHONY: toml-lint
.PHONY: typos
.PHONY: typos-fix
.PHONY: yaml-fmt
.PHONY: yaml-lint
