BROWSERS = $(shell find ./ -type d -regextype posix-extended -iregex ".\/(chrome|firefox)\/.*" | sed 's/^..//g' | sed 's/\//-/g')

list:
	@docker images | grep -E "(REPOSITORY|headless-browsers|xbrowser)" --color=never

runner:
	@docker build --tag="xbrowser" .

attach:
	@docker run --privileged -t -i xbrowser

base-image:
	@docker build --tag="headless-browsers:base" base/.

$(BROWSERS): base-image
	@docker build --tag="headless-browsers:$@" $(subst -,/,$@)/.

all: $(BROWSERS)
