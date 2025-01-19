#!make

help: ## Display this help screen
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		sed -E 's/:.+## /@/g' | \
		LC_ALL=C sort -t@ -k1,1 | \
		column -s@ -t

bash-all: bash-fmt bash-check bash-lint ## Run all bash tests

bash-check: ## Check format bash code
	@find . -type f -name "*.sh" | xargs shfmt -i 2 -d

bash-deps: ## Install bash dependencies
	@sudo apt-get install -y moreutils

bash-fmt: ## Format bash code
	@find . -type f -name "*.sh" | xargs shfmt -i 2 -w

bash-lint: ## Check lint bash code
	@find . -type f -name "*.sh" | xargs shellcheck -o all

comments-tidy: ## Tidy comments within code
	@./dev/comments-tidy.sh

doc-changelog: ## Write CHANGELOG.md
	@git cliff -o CHANGELOG.md

doc-readme: ## Write README.md
	@./dev/doc-readme.sh

dprint-check: ## Dprint check
	@dprint check

dprint-fmt: ## Dprint format
	@dprint fmt

go-audit: ## Audit go vulnerabilities
	@govulncheck ./...

go-build: ## Build go binary
	@go build

go-deps: ## Install go dependencies
	@go install github.com/axw/gocov/gocov@latest
	@go install github.com/golangci/golangci-lint/cmd/golangci-lint@v1.63.4
	@go install github.com/matm/gocov-html/cmd/gocov-html@latest
	@go install github.com/segmentio/golines@latest
	@go install golang.org/x/vuln/cmd/govulncheck@latest

go-fmt: ## Format go code
	@golines -w .

go-lint: ## Lint go code
	@golangci-lint run -c ./.golangci.yml

go-lint-fix: ## Fix lint go code
	@golangci-lint run --fix -c ./.golangci.yml

go-outdated: ## Display when go dependencies are out of date
	@go list -u -m all

go-run: ## Run go app
	@go run main.go

go-tests: ## Run go tests
	@go test ./... -v

links-check: ## Check links
	@./dev/links-check.sh

links-mirror: ## Check links
	@./dev/links-mirror.sh

lua-check: ## Check format lua code
	@find . -name "*.lua" | xargs stylua -c

lua-fmt: ## Format Lua code
	@find . -name "*.lua" | xargs stylua

makefile-descriptions: ## Check if all Makefile rules have descriptions
	@./dev/makefile-descriptions.sh

rs-audit: ## Audit Cargo.lock
	@cargo audit

rs-audit-fix: ## Update Cargo.toml to fix vulnerable dependency requirement
	@cargo audit fix

rs-build: ## Build binary
	@cargo build --release --locked --frozen --bins

rs-cargo-deps: ## Install cargo dependencies
	@cargo install --locked cargo-outdated
	@cargo install cargo-audit --features=fix
	@cargo install cargo-watch
	@cargo install typos-cli
	@rustup component add clippy

rs-check: ## Run check
	@cargo check

rs-dev: ## Run check in watch mode
	@cargo watch -c

rs-doc: ## Open app documentation
	@cargo doc --open

rs-fix: ## Fix rust code
	@cargo fix --allow-dirty --allow-staged --all-features --all-targets

rs-fmt: ## Format rust code
	@cargo fmt --all --check

rs-fmt-fix: ## Format fix rust code
	@cargo fmt --all

rs-install: ## Install binary
	@cargo install --path .

rs-lint: ## Lint rust code
	@cargo clippy --workspace --all-targets --all-features --no-deps -- -D warnings

rs-lint-fix: ## Fix lint rust code
	@cargo clippy --workspace --all-targets --all-features --no-deps --allow-dirty --allow-staged --fix -- -D warnings

rs-outdated: ## Display when dependencies are out of date
	@cargo outdated -wR

rs-tests: ## Run tests
	@cargo test

rs-uninstall: ## Uninstall binary
	@cargo uninstall

rs-update-cargo: ## Update dependencies
	@cargo update

rs-update-rustup: ## Update rust
	@rustup update

typos: ## Check typos
	@typos

typos-fix: ## Fix typos
	@typos -w

.PHONY: bash-all
.PHONY: bash-check
.PHONY: bash-deps
.PHONY: bash-fmt
.PHONY: bash-lint
.PHONY: comments-tidy
.PHONY: doc-changelog
.PHONY: doc-readme
.PHONY: dprint-check
.PHONY: dprint-fmt
.PHONY: go-audit
.PHONY: go-build
.PHONY: go-deps
.PHONY: go-fmt
.PHONY: go-lint
.PHONY: go-lint-fix
.PHONY: go-outdated
.PHONY: go-run
.PHONY: go-tests
.PHONY: help
.PHONY: links-check
.PHONY: links-mirror
.PHONY: lua-check
.PHONY: lua-fmt
.PHONY: makefile-descriptions
.PHONY: rs-audit
.PHONY: rs-audit-fix
.PHONY: rs-build
.PHONY: rs-cargo-deps
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
.PHONY: rs-update-cargo
.PHONY: rs-update-rustup
.PHONY: typos
.PHONY: typos-fix
