list:
	@docker images | grep -E "(REPOSITORY|headless-browsers)" --color=never

base-image:
	@docker build --tag="headless-browsers:base" base/.

chrome-stable: base-image
	@docker build --tag="headless-browsers:chrome-stable" chrome/stable/.
