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

    php vendor/bin/typo3cms extension:activate introduction
    php vendor/bin/typo3cms extension:activate extension_builder

### Lancer le serveur PHP

    cd web/
    php -S localhost:<port>

### Vider le cache

    php vendor/bin/typo3cms cache:flush
