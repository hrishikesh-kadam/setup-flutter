# setup-flutter

[![CI](https://github.com/hrishikesh-kadam/setup-flutter/actions/workflows/ci.yml/badge.svg)](https://github.com/hrishikesh-kadam/setup-flutter/actions/workflows/ci.yml)

Composite GitHub Actions to setup and cache the Flutter SDK.

This action is intended for the **Hosted Runners**. <br/>
It does the following:

- Checks the SHA of the requested input `ref` (defaults to stable) from the GitHub flutter repo and stores in `$FLUTTER_REF_HEAD`.
- Checks for the cache entry with key `flutter-${{ runner.os }}-${{ inputs.ref }}-${{ env.FLUTTER_REF_HEAD }}`.
- If the cache hit is true then it restores in the `$RUNNER_TOOL_CACHE/flutter` folder.
- If the cache hit is false then it downloads the Flutter from the GitHub repo to `$RUNNER_TOOL_CACHE/flutter` folder.
- Adds `$RUNNER_TOOL_CACHE/flutter/bin` folder to the `$GITHUB_PATH`.
- Runs `flutter --version`.
- If the cache hit was false then post job success, it caches `$RUNNER_TOOL_CACHE/flutter` folder using the key `flutter-${{ runner.os }}-${{ inputs.ref }}-${{ env.FLUTTER_REF_HEAD }}`.

Note that GitHub will remove any cache entries that have not been accessed in over 7 days. <br/>
This will help to save some minutes.
Which matters if your repository is private.


# Usage

Basic - 

```yml
steps:
  - uses: actions/checkout@v2
  - name: Setup Flutter
    uses: hrishikesh-kadam/setup-flutter@v1
  - run: # Run your flutter or dart command here
```

With specific reference - 

```yml
steps:
  - uses: actions/checkout@v2
  - name: Setup Flutter
    uses: hrishikesh-kadam/setup-flutter@v1
    with:
      ref: beta # or 2.8 or 2.8.0-3.3.pre,
  - run: # Run your flutter or dart command here
```
