# Plugin Tester

Clone the plugins you want to test as independent repositories directly inside this checkout. Lando mounts these directories into WordPress's `wp-content/plugins/` under the same names.

- `acf-image-size-select/`
- `menu-duplicator/`
- `query-monitor-image-sizes/`

For any plugin you plan to clone later, create its empty directory before starting Lando so it is writable from the host. Run `lando start` from the project root. Open [WordPress](https://plugintesting.lndo.site) and complete the installer on a fresh setup. Use `lando wp plugin list` to see the mounted plugins. Edit each plugin in its own checkout to see changes immediately.

[Adminer](http://127.0.0.1:8083) connects to the MariaDB 11.8 service at `db` with user `root`, password `root`, and database `wordpress`. WordPress files live in `.development/wordpress/`, and debug output goes to `.development/wordpress/debug.log`. Use `lando stop` to stop the app and `lando rebuild` after changing its container configuration.
