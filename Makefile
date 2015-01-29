BROWSERS = $(shell find ./ -type d -regextype posix-extended -iregex ".\/(chrome|firefox)\/.*" | sed 's/^..//g' | sed 's/\//-/g')

list:
	@docker images | grep -E "(REPOSITORY|headless-browsers)" --color=never

base-image:
	@docker build --tag="headless-browsers:base" base/.

$(BROWSERS): base-image
	@docker build --tag="headless-browsers:$@" $(subst -,/,$@)/.
