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

Note that GitHub will remove any cache entries that have not been accessed in over 7 days.


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
