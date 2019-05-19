.DEFAULT_GOAL:=help
.PHONY: all clean test SHELL

SHELL:=/bin/bash

##@ Tools

.PHONY: build test deploy build-init test-suite test-lint run
# phony is used to make sure theres no similar file such as <target> that cause the make recipie not to work

# core commands

build: build-init											## build project
	@echo ":: build project - ok ::"

test:  test-init											## test project
	@echo ":: test project - ok ::"

deploy: deploy-init 									## deploy files
	@echo ":: deploy project - ok ::"

# helper commands

build-init:
	@echo ":: checking build dependancies ::"
	command -v node || echo "missing node ( https://nodejs.org ) :: install with brew install node"
	command -v semver || echo "missing semver (from nodejs) :: install with yarn global add semver"
	command -v pandoc || echo "missing pandoc ( https://pandoc.org/ ) :: install with brew install pandoc"
	@echo ":: checking environment variables ::"

test-init:
	@echo ":: testing project ::"

test-lint:
	@echo ":: running lint ::"

deploy-init:
	@echo ":: deploying book to dist folder ::"
	sudo tlmgr update --all															# update texmaker
	sudo tlmgr install collection-fontsrecommended			# update tex fonts
	sudo tlmgr install lualatex-math
	sudo tlmgr install fontspec													# fontspec used by xelatex and lualatex
	pandoc src/book.md --pdf-engine=lualatex -f markdown-implicit_figures -o dist/book.pdf -V mainfont='FuraCode Nerd Font' -V fontsize=11pt -V geometry:margin=1.3in
	pandoc src/book.md --pdf-engine=lualatex -f markdown-implicit_figures -o dist/book.epub -V mainfont='FuraCode Nerd Font' -V fontsize=11pt -V geometry:margin=1.3in
	@echo "... done [ok]"
# misc commands

run:																	## run project
	@echo ":: run project ::"

##@ Helpers

.PHONY: version vpatch vminor vmajor help

version: 									## show current version
	@git describe --tags --abbrev=0

vinit: 										## initialise first version
	@git tag 0.1.0

vpatch: 									## show bumped version + patch (fix)
	@semver $$(git describe --tags --abbrev=0) -i patch

vminor: 									## show bumped version + minor (non breaking)
	@semver $$(git describe --tags --abbrev=0) -i minor

vmajor: 									## show bumped version + major (breaking)
	@semver $$(git describe --tags --abbrev=0) -i major

help:  										## display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
	@printf "\n"
