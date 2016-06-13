binPath = ./node_modules/elm/binwrappers/
package = $(binPath)elm-package
repl = $(binPath)elm-repl
reactor = $(binPath)elm-reactor

help: ## Prints help for targets with comments
	@echo proverbicam - The site of all wisdom
	@echo
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

install: ## Install dependencies for Elm
	npm install
	$(package) install --yes

repl:
	$(repl)

reactor:
	$(reactor)
