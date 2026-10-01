# Addon development conventions

- Target WoW Forever by default. Confirm the current interface number and APIs
  against the installed client before claiming compatibility. Add Retail or
  Classic metadata only after testing those clients.
- Keep the installed addon folder name and `.toc` filename identical. List Lua
  files in the `.toc` in dependency order.
- Add only the libraries, SavedVariables, and API compatibility code the addon
  needs. Version persistent data and provide migrations before changing its
  schema.
- Addons cannot make external HTTP requests. Do not put network code in Lua.
- Run the Lua 5.1 syntax and lint checks, then load the addon in-game, try
  `/addonname`, reload the UI, and check BugSack/BugGrabber for errors.
- Update supported-client, dependency, installation, and command documentation
  whenever they change.
