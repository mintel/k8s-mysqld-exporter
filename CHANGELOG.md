# Changelog

All notable changes to this project will be documented in this file.

## 0.12.1+mintel.0.2.1 (2020-11-13)
### Fixed
- Fix `cut` command and ensure we keep all chars from the environment variable

## 0.12.1+mintel.0.2.0 (2020-11-13)
### Changed
- Add `VAULT_ENABLED` option to enable/disable use of `vault-env`
- Add default for `DB_HOST`
- Add option for `DB_CONF` file path
- Make posix compliant

## 0.12.1+mintel.0.1.2
### Changed
- Fix path to `mysqld-exporter` in `COPY` command

## 0.12.1+mintel.0.1.1
### Changed
- Uses a custom image which fixes DSN handling
  - https://github.com/prometheus/mysqld_exporter/pull/485

## 0.12.1+mintel.0.1.0
### Added
- Initial release
