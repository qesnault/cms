COMPOSER?=/usr/bin/composer
CONSOLE= php vendor/bin/typo3cms

# Cache
cache-clear:
	$(CONSOLE) cache:flush

# Autoloader
autoload:
	$(COMPOSER) dumpautoload

# Installation
install: install-composer install-console install-ext install-config cache-clear autoload

# Vendors
install-composer:
	$(COMPOSER) install

# TYPO3
install-console:
	$(CONSOLE) install:setup

# Extensions
install-ext:
	$(CONSOLE) extension:activate bootstrap_package
	$(CONSOLE) extension:activate introduction
	$(CONSOLE) extension:activate extension_builder
	$(CONSOLE) extension:activate gridelements
	$(CONSOLE) extension:activate bootstrap_grids

# Adds link to clear system cache from backend
install-config:
	$(CONSOLE) configuration:set SYS/clearCacheSystem true

.PHONY: cache-clear autoload install install-composer install-console install-ext install-config