---
name: plugin-testing-setup
description: Explain and work within Jeremy Ross's WordPress plugin testing workspace at /home/jeremy/sites/plugin-testing. Use when the user asks how this setup works, asks about the local WordPress plugins directory at .development/wordpress/wp-content/plugins, or asks for orientation on acf-image-size-select, menu-duplicator, query-monitor-image-sizes, or Query Monitor integration in this project.
---

# Plugin Testing Setup

## Overview

Use this skill to orient Codex around the local WordPress plugin testing workspace and explain how the source plugin directories relate to the installed WordPress plugin directory.

The project root is usually `/home/jeremy/sites/plugin-testing`.

## Directory Map

- `.development/wordpress/wp-content/plugins/`: Treat as the WordPress plugin directory for the local development install. Use this directory only to inspect installed plugin code and understand how existing plugins work. Do not edit anything in this directory.
- `acf-image-size-select/`: Separate plugin repository for the WordPress.org plugin "Advanced Custom Fields: Image Size Select".
- `menu-duplicator/`: Separate plugin repository for the WordPress.org plugin "Menu Duplicator".
- `query-monitor-image-sizes/`: Local plugin repository that extends Query Monitor.

## Plugin Purposes

- `acf-image-size-select`: Adds an ACF field type that lets editors select from registered WordPress image sizes. Its main file is `acf-image-size-select/acf-image-size-select.php`, and the field class lives in `acf-image-size-select/fields/class-acf-field-image-size-select.php`.
- `menu-duplicator`: Adds an admin workflow for duplicating existing WordPress nav menus while preserving menu item settings. Its main file is `menu-duplicator/menu-duplicator.php`, with admin JavaScript in `menu-duplicator/scripts/menu-duplicator.js`.
- `query-monitor-image-sizes`: Adds a Query Monitor panel for registered image sizes. Its main file is `query-monitor-image-sizes/query-monitor-image-sizes.php`. The collector is `classes/class-qm-collector-image-sizes.php`; the HTML output is `classes/class-qm-output-html-image-sizes.php`.

## Working Rules

When asked to explain the setup:

1. Inspect the current directory tree before answering because plugin copies in `.development/wordpress/wp-content/plugins/` may change.
2. Explain that `acf-image-size-select/` and `menu-duplicator/` are source plugin directories for plugins that are in the WordPress Plugin Directory.
3. Explain that `query-monitor-image-sizes/` is a plugin source directory too, but it is a Query Monitor extension.
4. Describe `.development/wordpress/wp-content/plugins/` as the local WordPress install's plugin directory, used only for context, installed-copy inspection, and third-party plugin investigation.
5. Explain that custom plugin code changes should be made in the root source directories, not in `.development/wordpress/wp-content/plugins/`.

When asked to change custom plugin code:

1. Edit the source directories at the project root: `acf-image-size-select/`, `menu-duplicator/`, or `query-monitor-image-sizes/`.
2. Do not edit custom plugin copies inside `.development/wordpress/wp-content/plugins/`.
3. Use `.development/wordpress/wp-content/plugins/` only to investigate installed plugin behavior, third-party plugin APIs, or differences between installed copies and source directories.

When asked about code in `.development/wordpress/wp-content/plugins/`:

1. Read files there for context and explanation only.
2. Use installed third-party plugins such as Query Monitor and Advanced Custom Fields Pro to understand APIs, hooks, class names, and behavior.
3. If a requested change appears to require editing this directory, stop and explain that source changes belong in the root plugin directories.

## Verification

Use quick local checks when relevant:

- Confirm expected directories with `find .development/wordpress/wp-content/plugins -maxdepth 2 -type d | sort`.
- Confirm plugin headers in the main plugin files.
- For PHP edits, run `php -l` on changed PHP files when PHP is available.
- If investigating installed plugin behavior, inspect `.development/wordpress/wp-content/plugins/` but keep edits in the root source directories.
