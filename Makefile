.PHONY: help dev serve build preview new clean

help: ## Show this help message
	@echo "Available commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'

dev: ## Start Hugo development server with drafts
	hugo server -D

serve: ## Start Hugo server (no drafts)
	hugo server

build: ## Build Hugo site for production
	hugo --gc --minify

preview: ## Preview production build locally
	hugo server --gc --minify

new: ## Create new blog post (usage: make new POST=my-post-name)
	@if [ -z "$(POST)" ]; then \
		echo "Usage: make new POST=my-post-name"; \
		exit 1; \
	fi
	hugo new content/blogs/posts/$(POST).md
	@echo "Created: content/blogs/posts/$(POST).md"

clean: ## Clean build artifacts
	rm -rf public resources/_gen
