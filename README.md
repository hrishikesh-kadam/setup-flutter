# setup-flutter

[![CI](https://github.com/hrishikesh-kadam/setup-flutter/actions/workflows/ci.yml/badge.svg)](https://github.com/hrishikesh-kadam/setup-flutter/actions/workflows/ci.yml)

Composite GitHub Action to setup and cache the Flutter SDK.

Caching Flutter will help to save some minutes.  
Private repositories with Free plan has only 2,000 automation minutes/month.  
And the minutes are counted as -  
Linux - 1 minute counted as 1 regular minute.  
Windows - 1 minute counted as 2 regular minutes.  
macOS - 1 minute counted as 10 regular minutes.  
Usage for the month can be seen in https://github.com/settings/billing

Below are the stats of before and after caching based on the following conditions - 
1. Time is the lowest recorded time of the 'Setup Flutter' step, from  
   the multiple runs of [ci-compare.yml] workflow.
2. Ran on the same SHA of the Action.
3. Ran on the same ref(SHA) of the Flutter SDK.

<table>
    <thead>
        <tr>
            <th>Step</th>
            <th>OS</th>
            <th>Time</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td rowspan="3">Setup Flutter (Before caching)</td>
            <td>ubuntu-latest</td>
            <td><a href="https://github.com/hrishikesh-kadam/setup-flutter/actions/runs/4519066835/jobs/7959323498">44s</td>
        </tr>
        <tr>
            <td>windows-latest</td>
            <td><a href="https://github.com/hrishikesh-kadam/setup-flutter/actions/runs/4519066835/jobs/7959323540">74s</td>
        </tr>
        <tr>
            <td>macos-latest</td>
            <td><a href="https://github.com/hrishikesh-kadam/setup-flutter/actions/runs/4519081549/jobs/7959348166">60s</td>
        </tr>
        <tr>
            <td rowspan="3">Setup Flutter (After caching)</td>
            <td>ubuntu-latest</td>
            <td><a href="https://github.com/hrishikesh-kadam/setup-flutter/actions/runs/4519081549/jobs/7959378374">10s</td>
        </tr>
        <tr>
            <td>windows-latest</td>
            <td><a href="https://github.com/hrishikesh-kadam/setup-flutter/actions/runs/4518568387/jobs/7958540918">24s</td>
        </tr>
        <tr>
            <td>macos-latest</td>
            <td><a href="https://github.com/hrishikesh-kadam/setup-flutter/actions/runs/4519066835/jobs/7959333266">15s</td>
        </tr>
    </tbody>
</table>


# Please Note

- Flutter is installed via GitHub repository source and not via `https://storage.googleapis.com` source.  
  The later source comes with [Installation Bundles].  
  See also, [Flutter's Official Installation].
- GitHub will remove any cache entries that have not been accessed in over 7 days.
- This action is intended for the **GitHub-hosted runners**.  
  Not tested on the **Self-hosted runners** yet.


# Usage

## Basic

```yml
steps:
  - uses: actions/checkout@v3
  - name: Setup Flutter
    uses: hrishikesh-kadam/setup-flutter@v1
  - run: # Run your flutter or dart command here
```

## `ref`

<table>
  <tr>
    <td>description</td>
    <td>channel (stable, beta or master), version(3.7.8) or any git reference(3.9.0-0.1.pre).</td>
  </tr>
  <tr>
    <td>required</td>
    <td>false</td>
  </tr>
  <tr>
    <td>default</td>
    <td>'stable'</td>
  </tr>
</table>

```yml
steps:
  - uses: actions/checkout@v3
  - name: Setup Flutter
    uses: hrishikesh-kadam/setup-flutter@v1
    with:
      ref: beta # or 3.7.8 or 3.9.0-0.1.pre
```

## `installationPath`

<table>
  <tr>
    <td>description</td>
    <td>Installation Path of Flutter SDK.</td>
  </tr>
  <tr>
    <td>required</td>
    <td>false</td>
  </tr>
  <tr>
    <td>default</td>
    <td>'${{ runner.tool_cache }}/flutter'</td>
  </tr>
</table>

```yml
steps:
  - uses: actions/checkout@v3
  - name: Setup Flutter
    uses: hrishikesh-kadam/setup-flutter@v1
    with:
      installationPath: '${{ runner.tool_cache }}/flutter-foo'
```

## `actionsCache`

<table>
  <tr>
    <td>description</td>
    <td>Cache Flutter SDK for subsequent GitHub Actions Workflow.</td>
  </tr>
  <tr>
    <td>required</td>
    <td>false</td>
  </tr>
  <tr>
    <td>default</td>
    <td>'true'</td>
  </tr>
</table>

```yml
steps:
  - uses: actions/checkout@v3
  - name: Setup Flutter
    uses: hrishikesh-kadam/setup-flutter@v1
    with:
      actionsCache: 'false'
```

## `actionsCacheKey`

<table>
  <tr>
    <td>description</td>
    <td>An explicit key for a cache entry.<br/>
      Default key will be computed as `flutter-{OS}-{ref}-{ref_head}`.
    </td>
  </tr>
  <tr>
    <td>required</td>
    <td>false</td>
  </tr>
  <tr>
    <td>default</td>
    <td>''</td>
  </tr>
</table>

```yml
steps:
  - uses: actions/checkout@v3
  - name: Setup Flutter
    uses: hrishikesh-kadam/setup-flutter@v1
    with:
      actionsCacheKey: 'flutter-${{ runner.os }}'
```

## `setFlutterRootPath`

<table>
  <tr>
    <td>description</td>
    <td>Set FLUTTER_ROOT to path where Flutter is installed.</td>
  </tr>
  <tr>
    <td>required</td>
    <td>false</td>
  </tr>
  <tr>
    <td>default</td>
    <td>'false'</td>
  </tr>
</table>


```yml
steps:
  - uses: actions/checkout@v3
  - name: Setup Flutter
    uses: hrishikesh-kadam/setup-flutter@v1
    with:
      setFlutterRootPath: 'true'
```

## `setPubCachePath`

<table>
  <tr>
    <td>description</td>
    <td>Set PUB_CACHE to desired path, where pub saves dependencies.</td>
  </tr>
  <tr>
    <td>required</td>
    <td>false</td>
  </tr>
  <tr>
    <td>default</td>
    <td>''</td>
  </tr>
</table>

```yml
my-job:
  runs-on: ${{ matrix.runner }}
  strategy:
    matrix:
      runner: [ ubuntu-latest, macos-latest ]
      pubCachePath: [ '$HOME/.pub-cache' ]
      include:
        - runner: windows-latest
          pubCachePath: '$LOCALAPPDATA\Pub\Cache'
  steps:
    - uses: actions/checkout@v3
    - name: Setup Flutter
      uses: hrishikesh-kadam/setup-flutter@v1
      with:
        setPubCachePath: ${{ matrix.pubCachePath }}
```

## `addPubCacheBinToPath`

<table>
  <tr>
    <td>description</td>
    <td>Add PUB_CACHE bin to PATH.<br/>
      Note: On Windows, activated global packages can be run by without specifying <code>dart pub global run</code> only on pwsh, cmd and powershell.
    </td>
  </tr>
  <tr>
    <td>required</td>
    <td>false</td>
  </tr>
  <tr>
    <td>default</td>
    <td>'false'</td>
  </tr>
</table>

```yml
steps:
  - uses: actions/checkout@v3
  - name: Setup Flutter
    uses: hrishikesh-kadam/setup-flutter@v1
    with:
      addPubCacheBinToPath: 'true'
  - run: |
      dart pub global activate markdown
      markdown --help
```

## `flutterPrecache`

<table>
  <tr>
    <td>description</td>
    <td>Populate the Flutter tool's cache of binary artifacts.<br/>
      For additional download options, see <code>flutter help precache</code>.
    </td>
  </tr>
  <tr>
    <td>required</td>
    <td>false</td>
  </tr>
  <tr>
    <td>default</td>
    <td>'false'</td>
  </tr>
</table>

```yml
steps:
  - uses: actions/checkout@v3
  - name: Setup Flutter
    uses: hrishikesh-kadam/setup-flutter@v1
    with:
      flutterPrecache: 'true'
        # will execute `flutter precache`
      # flutterPrecache: '--linux --web'
        # will execute `flutter precache --linux --web`
```

[ci-compare.yml]: https://github.com/hrishikesh-kadam/setup-flutter/blob/main/.github/workflows/ci-compare.yml
[Installation Bundles]: https://github.com/flutter/flutter/wiki/Flutter-Installation-Bundles
[Flutter's Official Installation]: https://docs.flutter.dev/get-started/install
