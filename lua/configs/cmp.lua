local cmp = require 'cmp'
local nvChadCmpConf = require 'nvchad.configs.cmp'

nvChadCmpConf.mapping["<C-n>"] = cmp.mapping.complete()

return nvChadCmpConf
