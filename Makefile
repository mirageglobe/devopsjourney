.DEFAULT_GOAL:=help
.PHONY: all clean test SHELL

SHELL:=/bin/bash

##@ Tools

.PHONY: build test deploy build-init test-suite test-lint run
# phony is used to make sure theres no similar file such as <target> that cause the make recipie not to work

# core commands

build: env build-core									## build project
	@echo ":: build project - ok ::"

test:  test-core											## test project
	@echo ":: test project - ok ::"

deploy: deploy-core 									## package up the book to pdf and markdown
	@echo ":: deploy project - ok ::"

# helper commands

env:
	@echo ":: installing dependancies ::"
	sudo tlmgr update --self && sudo tlmgr update --all			# update texmaker
	sudo tlmgr install collection-fontsrecommended					# update tex fonts
	sudo tlmgr install lualatex-math
	sudo tlmgr install fontspec															# fontspec used by xelatex and lualatex
	@echo "... done [ok]"

build-core:
	@echo ":: checking build dependancies ::"
	command -v node || echo "missing node ( https://nodejs.org ) :: install with brew install node"
	command -v semver || echo "missing semver (from nodejs) :: install with yarn global add semver"
	command -v pandoc || echo "missing pandoc ( https://pandoc.org/ ) :: install with brew install pandoc"
	@echo ":: checking environment variables ::"

test-core:
	@echo ":: testing project ::"
	@echo ":: running lint ::"

deploy-core: 										
	@echo ":: deploying book to dist folder ::"
	pandoc src/book.md --pdf-engine=lualatex -f markdown-implicit_figures -o dist/book.pdf -V mainfont='FiraCode Nerd Font' -V fontsize=11pt -V geometry:margin=1.3in
	pandoc src/book.md --pdf-engine=lualatex -f markdown-implicit_figures -o dist/book.epub -V mainfont='FiraCode Nerd Font' -V fontsize=11pt -V geometry:margin=1.3in
	@echo "... done [ok]"

##@ Helpers

# semver tool based on - https://github.com/fsaintjacques/semver-tool

version: 									## show current version
	@git describe --tags --abbrev=0

vinit: 										## initialise first version
	@git tag 0.1.0

vpatch:										## show bumped version + patch (fix) - use : git tag $(make vpatch)
	@semver bump patch $$(git describe --tags --abbrev=0)

vminor:										## show bumped version + minor (non breaking) - use : git tag $(make vminor)
	@semver bump minor $$(git describe --tags --abbrev=0)

vmajor:										## show bumped version + major (breaking) - git tag $(make vmajor)
	@semver bump major $$(git describe --tags --abbrev=0)

help:												## display this help
	@awk 'BEGIN { FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"; } \
		/^[a-zA-Z0-9_-]+:.*?##/ { printf "  \033[36m%-30s\033[0m %s\n", $$1, $$2; } \
		/^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5); } \
		END { printf "\n"; }' $(MAKEFILE_LIST)
