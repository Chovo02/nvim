require "nvchad.mappings"

local map = vim.keymap.set

-- add yours here


-- Basic mappings
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Python virtual environment
map("n", "<leader>vs", "<cmd>VenvSelect<cr>", { desc = "Python: Select VirtualEnv" })
map("n", "<leader>vc", "<cmd>VenvSelectCached<cr>", { desc = "Python: Select Cached VirtualEnv" })


-- Jupyter Notebook (Molten)
map("n", "<leader>mi", "<cmd>MoltenInit<cr>", { desc = "Molten: Init Kernel" })
map("n", "<leader>mr", "<cmd>MoltenEvaluateCell<cr>", { desc = "Molten: Run Cell" })
map("v", "<leader>mv", ":MoltenEvaluateVisual<cr>", { desc = "Molten: Run Visual Selection" })
map("n", "<leader>mo", "<cmd>MoltenEnterOutput<cr>", { desc = "Molten: Enter Output" })
map("n", "<leader>mh", "<cmd>MoltenHideOutput<cr>", { desc = "Molten: Hide Output" })
map("n", "<leader>md", "<cmd>MoltenDelete<cr>", { desc = "Molten: Delete Cell" })
map("n", "<leader>mc", "<cmd>MoltenChange<cr>", { desc = "Molten: Change Cell Type" })
map("n", "<leader>mn", "<cmd>MoltenNext<cr>", { desc = "Molten: Next Cell" })
map("n", "<leader>mp", "<cmd>MoltenPrev<cr>", { desc = "Molten: Previous Cell" })
map("n", "<leader>ms", "<cmd>MoltenRestart<cr>", { desc = "Molten: Restart Kernel" })

-- AI (already defined in plugins but adding here for reference)
-- <leader>ai - Opencode Chat (defined in plugins/ai.lua)
-- <leader>ac - Opencode with Selection (defined in plugins/ai.lua)
-- <Tab> - Accept Supermaven suggestion (defined in plugins/ai.lua)


-- Diagnostics (Trouble)
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Trouble: Diagnostics (All)" })
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Trouble: Diagnostics (Buffer)" })
map("n", "<leader>xl", "<cmd>Trouble loclist toggle<cr>", { desc = "Trouble: Location List" })
map("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>", { desc = "Trouble: Quickfix" })
map("n", "<leader>xr", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "Trouble: LSP References" })
map("n", "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Trouble: Symbols" })
map("n", "<leader>xt", "<cmd>Trouble todo toggle<cr>", { desc = "Trouble: Todo Comments" })
map("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics toggle<cr>", { desc = "Trouble: Workspace Diagnostics" })

-- Todo comments
map("n", "]t", function() require("todo-comments").jump_next() end, { desc = "Next todo comment" })
map("n", "[t", function() require("todo-comments").jump_prev() end, { desc = "Previous todo comment" })
map("n", "<leader>td", "<cmd>TodoTrouble<cr>", { desc = "Todo (Trouble)" })
map("n", "<leader>tD", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", { desc = "Todo/Fix/Fixme (Trouble)" })
map("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find Todo" })
map("n", "<leader>fT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", { desc = "Find Todo/Fix/Fixme" })

