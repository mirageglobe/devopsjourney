
# ================================================================ info ===== #

# ======================================================= configuration ===== #

# ------------------------------------------------------------- targets ----- #

# defaults
MENU := all clean test

# helpers
MENU += help readme

# main
MENU += setup-env build

# load phony
.PHONY: $(MENU)

# ------------------------------------------------------------ settings ----- #

# set default target
.DEFAULT_GOAL := help

# sets all lines in the recipe to be passed in a single shell invocation
.ONESHELL:

# ----------------------------------------------- environment variables ----- #

# load current shell env vars into makefile shell env
export

# ----------------------------------------------------------- functions ----- #

# note that define can only take single line or rule

define func_print_arrow
	# ==> $(1)
endef

define func_print_header
	# =================================================== $(1) ===== #
endef

define func_check_file_regex
	cat $(1) || grep "$(2)"
endef

define func_check_command
	command -V $(1) || printf "$(2)"
endef

define func_print_tab
	printf "%s\t\t%s\t\t%s\n" $(1) $(2) $(3)
endef

# ================================================================ main ===== #

##@ Helpers

help:														## display this help
	@awk 'BEGIN { FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"; } \
		/^[a-zA-Z0-9_-]+:.*?##/ { printf "  \033[36m%-30s\033[0m %s\n", $$1, $$2; } \
		/^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5); } \
		END { printf ""; }' $(MAKEFILE_LIST)

readme:													## show information and notes
	$(call func_print_header,"show readme")
	@touch README.md
	@cat README.md

##@ Menu

# core commands

setup-env: 											## setup tex
	$(call func_print_header,"setup")
	@echo ":: installing dependancies ::"
	sudo tlmgr update --self && sudo tlmgr update --all			# update tex
	sudo tlmgr install collection-fontsrecommended					# update tex fonts
	sudo tlmgr install lualatex-math
	sudo tlmgr install fontspec															# fontspec used by xelatex and lualatex
	@echo "... done [ok]"

build: 													## build book
	$(call func_print_header,"build")
	@echo ":: deploying book to dist folder ::"
	pandoc src/book.md --pdf-engine=lualatex -f markdown-implicit_figures -o dist/book.pdf -V mainfont='FiraCode Nerd Font' -V fontsize=12pt -V geometry:margin=1.3in
	pandoc src/book.md --pdf-engine=lualatex -f markdown-implicit_figures -o dist/book.epub -V mainfont='FiraCode Nerd Font' -V fontsize=12pt -V geometry:margin=1.3in
	@echo "... done [ok]"
