# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.2.0] - 2021-12-29
### Changed
- Input `setPubCachePath` <br/><br/>

  For Windows runners, it now accepts bash understandable paths instead of <br/>
  pwsh understandable paths. <br/>
  Example: Previously - <br/>
  `setPubCachePath: '$env:LOCALAPPDATA\Pub\Cache'` <br/>
  Now - <br/>
  `setPubCachePath: '$LOCALAPPDATA\Pub\Cache'` <br/><br/>

  For Ubuntu and macOS runners, avoid using tilde `~` in paths. <br/>
  Example: Previously - <br/>
  `setPubCachePath: '~/.pub-cache'` <br/>
  Now - <br/>
  `setPubCachePath: '$HOME/.pub-cache'` <br/>

## [1.1.1] - 2021-12-23
### Fixed
- Input addPubCacheBinToPath

## [1.1.0] - 2021-12-22
### Added
- Inputs setFlutterRootPath, setPubCachePath and addPubCacheBinToPath. 

## [1.0.0] - 2021-12-10
Initial release
