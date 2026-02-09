require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
--

vim.opt.nu = true
vim.opt.relativenumber = true
vim.o.statuscolumn = table.concat({
  "%s%#Comment#%C",
  -- Col absolute
  "%#Comment#%{(v:lnum % 5 == 0) ? v:lnum : ''}",
  "%#NonText#%{(v:lnum % 5 != 0) ? v:lnum : ''}",
  -- Separator
  "%= ",
  -- Col relative
  "%#Comment#%{(v:relnum % 5 == 0 && v:relnum != 0) ? v:relnum : ''}",
  "%#NonText#%{(v:relnum % 5 != 0) ? v:relnum : ''}",
  "%#NvimCurly#%{(v:relnum == 0 ? '󰜴' : '')}",
  -- End
  "%#LineNr#"
})
vim.opt.fillchars = {
  fold = " ",          -- Fill character for the fold line itself
  foldopen = "",      -- Icon for an expanded fold (requires Nerd Font)
  foldclose = "",     -- Icon for a collapsed fold
  foldsep = " ",       -- Column separator for nested folds
}
--vim.opt.foldcolumn = "1"
vim.g.clipboard = {
  name = 'OSC 52',
  copy = {
    ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
    ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
  },
  paste = {
    ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
    ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
  },
}
