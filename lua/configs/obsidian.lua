
local opts = {
  legacy_commands = false, -- this will be removed in the next major release
  workspaces = {
    {
      name = "personal",
      path = "~/obsidian/dc-obsidian-personnal",
    },
  },
  daily_notes = {
    folder = "dailies",
  }
}

return opts
