# AutoTrackHerbs

Automatically keeps **Find Herbs** minimap tracking enabled on WoW Forever.

## Features

- Re-enables Find Herbs after login, UI reload, resurrection, and tracking changes.
- Finds the tracking entry by spell ID, independent of the client's language.
- Does nothing on characters without Find Herbs.
- Appears under **Professions** in the AddOns list with a flower icon.
- No settings, slash commands, dependencies, or saved variables.

While enabled, the addon intentionally turns Find Herbs back on if you disable
it manually. Disable the addon if you want herb tracking to remain off.

## Compatibility

Targets the WoW Forever beta client, interface `16001`, using
`C_Minimap.GetNumTrackingTypes`, `C_Minimap.GetTrackingInfo`, and
`C_Minimap.SetTracking`. Retail and other Classic clients are not claimed as
supported without in-game testing.

## Installation

Download a release zip from
[GitHub Releases](https://github.com/psykzz/wow-autotrackherbs/releases) and extract
the `AutoTrackHerbs` folder into
`World of Warcraft\_classic_beta_\Interface\AddOns`.

The installed folder must contain `AutoTrackHerbs.toc` and `AutoTrackHerbs.lua`.
Restart WoW and enable **Auto Track Herbs** in the AddOns list.

For development before the first release, copy those two files from the
repository into an `AutoTrackHerbs` addon folder.

## Development and releases

Created from [wow-template](https://github.com/psykzz/wow-template). GitHub Actions
checks Lua 5.1 syntax and Luacheck on pushes to `main` and pull requests:

```powershell
luac5.1 -p AutoTrackHerbs.lua
luacheck AutoTrackHerbs.lua
```

In-game, test on an herbalist: turn Find Herbs off, reload the UI, and resurrect.
Tracking should return automatically. Test a non-herbalist as well, and check
BugSack/BugGrabber for errors.

After in-game verification, push a `v*` semantic-version tag to create a GitHub
release zip using BigWigs Packager. The packager substitutes `@project-version@`
in the TOC and installs the addon under `AutoTrackHerbs`. The release workflow
uses `GITHUB_TOKEN`; no external publishing credentials are required.

## License

MIT. See [LICENSE](LICENSE).
