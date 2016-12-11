# Installation de TYPO3

> Avec composer et typo3_console

## Prérequis

- PHP >= 5.6
- MySQL >= 5.5
- Apache >= 2.1 (si possible)
- Un utilisateur ayant accès à **une base de données vide**

## Installation

### Cloner le dépôt

    git clone git@github.com:pitchart/dawin-typo3-cms-distribution.git ./cms
    cd cms


### Installer les sources via composer

    composer install

### Installer TYPO3 via la console

    php vendor/bin/typo3cms install:setup


## Post installation

### Activer les extensions nécessaires

    php vendor/bin/typo3cms extension:activate bootstrap_package,introduction
    php vendor/bin/typo3cms extension:activate extension_builder

### Activer la vidange du cache système depuis l'interface de gestion

    php vendor/bin/typo3cms configuration:set SYS/clearCacheSystem true

### Vider le cache

    php vendor/bin/typo3cms cache:flush

### Lancer le serveur PHP

    cd web/
    php -S localhost:<port>

## A savoir

### Renseigner votre extension pour chargement des classes

    // composer.json
    "autoload": {
      "psr-4": {
        "MyVendor\\MySitePackage\\": "typo3conf/ext/my_site_package/Classes"
      }
    }

### Configuration composer de votre extension

    {
      "name": "my-vendor/my-extension-key",
      "type": "typo3-cms-extension",
      "version": "x.x.x",
      "description": "...",
      "require": {
        "typo3/cms-core": "^7.6"
      },
      "replace": {
          "my_extension_key": "self.version",
          "typo3-ter/my-extension-key": "self.version"
      },
      "autoload": {
        "psr-4": {
          "MyVendor\\MyExtensionKey\\": "Classes/"
        }
      }
    }

## Références 
- [Liste des extensions TYPO3 compatibles composer](https://composer.typo3.org/satis.html)
- [Documentations TYPO3](https://docs.typo3.org/typo3cms/References.html)
