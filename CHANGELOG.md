# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.3.1] - 2023-03-28
### Fixed
- Input `actionsCacheKey`

## [1.3.0] - 2023-03-25
### Added
- Inputs `installationPath`, `actionsCache`, `actionsCacheKey` and `flutterPrecache`.

### Removed
- depth 1 from git clone command, so that Flutter tool can construct version from non-tagged references.

## [1.2.0] - 2021-12-29
### Changed
- Input `setPubCachePath`

  For Windows runners, it now accepts bash understandable paths instead of pwsh understandable paths.  
  Example: Previously -  
  `setPubCachePath: '$env:LOCALAPPDATA\Pub\Cache'`  
  Now -  
  `setPubCachePath: '$LOCALAPPDATA\Pub\Cache'`

  For Ubuntu and macOS runners, avoid using tilde `~` in paths.  
  Example: Previously -  
  `setPubCachePath: '~/.pub-cache'`  
  Now -  
  `setPubCachePath: '$HOME/.pub-cache'`

## [1.1.1] - 2021-12-23
### Fixed
- Input `addPubCacheBinToPath`

## [1.1.0] - 2021-12-22
### Added
- Inputs `setFlutterRootPath`, `setPubCachePath` and `addPubCacheBinToPath`. 

## [1.0.0] - 2021-12-10
Initial release
