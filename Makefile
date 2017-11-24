COMPOSER?=/usr/local/bin/composer
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

# Configurations
install-config: config-cache config-dev

config-cache:
	$(CONSOLE) configuration:set SYS/clearCacheSystem true

config-dev:
	$(CONSOLE) configuration:set SYS/displayErrors 1
	$(CONSOLE) configuration:set SYS/devIPmask '*'
	$(CONSOLE) configuration:set SYS/sqlDebug 1
	$(CONSOLE) configuration:set SYS/enableDeprecationLog file
	$(CONSOLE) configuration:set SYS/systemLogLevel 0
	$(CONSOLE) configuration:set BE/debug true
	$(CONSOLE) configuration:set FE/debug true

.PHONY: cache-clear autoload install install-composer install-console install-ext install-config config-cache config-dev
