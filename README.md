# AddonName

A small WoW Forever addon starter. It loads on login and provides `/addonname`
as a smoke test. No libraries, SavedVariables, or external services are required.

## Start a new addon

1. Click **Use this template** on GitHub and create a repository (for example,
   `wow-my-addon`). Clone it outside the game's `AddOns` directory.
2. Pick your addon's installed folder name (for example, `MyAddon`). Rename
   `AddonName.toc` and `AddonName.lua` to match. Replace `AddonName`,
   `ADDONNAME`, and `/addonname` in the TOC, Lua file, `.pkgmeta`, workflow,
   `AGENTS.md`, and this README. The installed folder name
   **must match the TOC filename**, regardless of the GitHub repository name.
3. Edit the TOC title, notes, author, and interface number for the client you
   actually support. `16001` is the observed WoW Forever beta interface number
   as of September 2026; check the installed client's current number before
   shipping. Replace the sample Lua with your addon code, listing any new Lua
   files in the TOC in load order and adding them to the Lua checks in
   `.github/workflows/check.yml`.
4. Decide the new addon's license and copyright holder. Update or remove the
   inherited `LICENSE` as appropriate. Replace this README's setup instructions
   with your addon's features, installation steps, commands, dependencies, and
   tested game versions.

For local development, install or link the addon as
`World of Warcraft\_classic_beta_\Interface\AddOns\MyAddon\MyAddon.toc`. Log in,
run `/myaddon` (or your chosen command), then `/reload`; check BugSack/BugGrabber
for Lua errors. A TOC number alone does not prove API compatibility. Only list
Retail or other Classic clients after testing them and adding the appropriate
interface metadata.

## Checks and releases

GitHub Actions checks Lua 5.1 syntax and Luacheck on pushes to `main` and pull
requests. Locally, run `luac5.1 -p MyAddon.lua` and `luacheck MyAddon.lua` after
installing Lua 5.1 and Luacheck. Extend `.luacheckrc` only with WoW globals
actually used by your addon.

After testing in-game, push a `v*` tag (for example, `v0.1.0`) to build a GitHub
release zip via [BigWigsMods/packager](https://github.com/BigWigsMods/packager).
The `.pkgmeta` `package-as` value controls the folder name in the zip; keep it
equal to the TOC filename. The release job uses the built-in `GITHUB_TOKEN` and
needs no external upload credentials. Add CurseForge/Wago credentials only if
you decide to publish there.

## Why this shape?

This template keeps the small TOC + Lua layout of
[AutoShare](https://github.com/psykzz/wow-autoshare), the tag-based packager
workflow and package metadata common in recent `psykzz/wow-*` addons, and a
focused Lua 5.1 lint configuration. Add capability checks, modular files, or
libraries when the addon needs them rather than inheriting unrelated gameplay
code or Retail-only APIs.

Patterns worth adopting when a new addon grows:

- Feature-detect divergent APIs instead of assuming all clients with a TOC
  number behave alike, as in [CooldownAlert](https://github.com/psykzz/wow-cooldown-alert)
  and AutoShare.
- Split utility, core, UI, and slash-command files when their load order
  matters, as in [GuildPriceCheck](https://github.com/psykzz/wow-guildpricecheck);
  declare a required addon dependency in the TOC if one is actually needed.
- Avoid claiming a shared slash command before checking whether another
  addon owns it, as in [Way](https://github.com/psykzz/wow-way). This starter's
  `/addonname` is deliberately unique until you rename it.
