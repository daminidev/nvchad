local dap = require("dap")
local dapui = require("dapui")
dapui.setup()

-- Ouvre/ferme automatiquement l'UI quand le debug démarre/s'arrête
dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

