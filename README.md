# setup-flutter

[![CI](https://github.com/hrishikesh-kadam/setup-flutter/actions/workflows/ci.yml/badge.svg)](https://github.com/hrishikesh-kadam/setup-flutter/actions/workflows/ci.yml)

Composite GitHub Action to setup and cache the Flutter SDK.

Caching Flutter will help to save some minutes. <br/>
Private repositories with Free plan has only 2,000 automation minutes/month. <br/>
And the minutes are counted as - <br/>
Linux - 1 minute counted as 1 regular minute. <br/>
Windows - 1 minute counted as 2 regular minutes. <br/>
macOS - 1 minute counted as 10 regular minutes. <br/>
Usage for the month can be seen in https://github.com/settings/billing

Stats from workflow runs of before and after caching - 

<table>
    <thead>
        <tr>
            <th>Step</th>
            <th>Job</th>
            <th>Time</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td rowspan="3">Setup Flutter (Before caching)</td>
            <td><a href="https://github.com/hrishikesh-kadam/setup-flutter/runs/4484397669?check_suite_focus=true">test-setup-flutter (ubuntu-latest)</a></td>
            <td>48s</td>
        </tr>
        <tr>
            <td><a href="https://github.com/hrishikesh-kadam/setup-flutter/runs/4484397722?check_suite_focus=true">test-setup-flutter (windows-latest)</a></td>
            <td>1m 54s</td>
        </tr>
        <tr>
            <td><a href="https://github.com/hrishikesh-kadam/setup-flutter/runs/4484397797?check_suite_focus=true">test-setup-flutter (macos-latest)</a></td>
            <td>1m 2s</td>
        </tr>
        <tr>
            <td rowspan="3">Setup Flutter (After caching)</td>
            <td><a href="https://github.com/hrishikesh-kadam/setup-flutter/runs/4484539956?check_suite_focus=true">test-setup-flutter (ubuntu-latest)</a></td>
            <td>9s</td>
        </tr>
        <tr>
            <td><a href="https://github.com/hrishikesh-kadam/setup-flutter/runs/4484540003?check_suite_focus=true">test-setup-flutter (windows-latest)</a></td>
            <td>32s</td>
        </tr>
        <tr>
            <td><a href="https://github.com/hrishikesh-kadam/setup-flutter/runs/4484540044?check_suite_focus=true">test-setup-flutter (macos-latest)</a></td>
            <td>13s</td>
        </tr>
    </tbody>
</table>


# Please Note

- This action is intended for the **Hosted Runners**.
- Flutter is installed via GitHub repository source and not <br/>
  via `https://storage.googleapis.com` source.
- GitHub will remove any cache entries that have not been accessed in over 7 days.


# Planned Future releases 

- Support for the Self Hosted Runners.
- Flutter installation via `https://storage.googleapis.com` source as well. <br/>
  Like done in https://github.com/subosito/flutter-action
- Support for the caret versioning.


# Usage

Basic - 

```yml
steps:
  - uses: actions/checkout@v2
  - name: Setup Flutter
    uses: hrishikesh-kadam/setup-flutter@v1
  - run: # Run your flutter or dart command here
```

ref: <br/>
&nbsp; &nbsp; description: 'channel (stable, beta or master), version(2.8.1) or any git reference(2.9.0-0.1.pre).' <br/>
&nbsp; &nbsp; required: false <br/>
&nbsp; &nbsp; default: 'stable' <br/>

```yml
steps:
  - uses: actions/checkout@v2
  - name: Setup Flutter
    uses: hrishikesh-kadam/setup-flutter@v1
    with:
      ref: beta # or 2.8.1 or 2.9.0-0.1.pre,
```

setFlutterRootPath: <br/>
&nbsp; &nbsp; description: 'Set FLUTTER_ROOT to path where Flutter is installed.' <br/>
&nbsp; &nbsp; required: false <br/>
&nbsp; &nbsp; default: 'false' <br/>

```yml
steps:
  - uses: actions/checkout@v2
  - name: Setup Flutter
    uses: hrishikesh-kadam/setup-flutter@v1
    with:
      setFlutterRootPath: 'true'
```

setPubCachePath: <br/>
&nbsp; &nbsp; description: 'Set PUB_CACHE to desired path, where pub saves dependencies.' <br/>
&nbsp; &nbsp; required: false <br/>
&nbsp; &nbsp; default: '' <br/>

```yml
my-job:
  runs-on: ${{ matrix.runner }}
  strategy:
    fail-fast: false
    matrix:
      runner: [ ubuntu-latest, macos-latest ]
      pubCachePath: [ '$HOME/.pub-cache' ]
      include:
        - runner: windows-latest
          pubCachePath: '$LOCALAPPDATA\Pub\Cache'
  steps:
    - uses: actions/checkout@v2
    - name: Setup Flutter
      uses: hrishikesh-kadam/setup-flutter@v1
      with:
        setPubCachePath: ${{ matrix.pubCachePath }}
```

addPubCacheBinToPath: <br/>
&nbsp; &nbsp; description: 'Add PUB_CACHE bin to PATH. <br/>
&nbsp; &nbsp; &nbsp; &nbsp; Note: On Windows, activated global packages can be run by without specifying <br/>
&nbsp; &nbsp; &nbsp; &nbsp; `dart pub global run` only on pwsh, cmd and powershell.' <br/>
&nbsp; &nbsp; required: false <br/>
&nbsp; &nbsp; default: 'false' <br/>

```yml
steps:
  - uses: actions/checkout@v2
  - name: Setup Flutter
    uses: hrishikesh-kadam/setup-flutter@v1
    with:
      addPubCacheBinToPath: 'true'
  - run: |
      dart pub global activate devtools
      devtools --help
```
