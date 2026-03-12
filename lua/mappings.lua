require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- Basic mappings
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Python virtual environment
map("n", "<leader>vs", "<cmd>VenvSelect<cr>", { desc = "Python: Select VirtualEnv" })
map("n", "<leader>vc", "<cmd>VenvSelectCached<cr>", { desc = "Python: Select Cached VirtualEnv" })

-- Testing
map("n", "<leader>tt", function() require("neotest").run.run() end, { desc = "Test: Run Nearest" })
map("n", "<leader>tT", function() require("neotest").run.run(vim.fn.expand("%")) end, { desc = "Test: Run File" })
map("n", "<leader>ts", function() require("neotest").summary.toggle() end, { desc = "Test: Toggle Summary" })
map("n", "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, { desc = "Test: Show Output" })
map("n", "<leader>tO", function() require("neotest").output_panel.toggle() end, { desc = "Test: Toggle Output Panel" })
map("n", "<leader>td", function() require("neotest").run.run({ strategy = "dap" }) end, { desc = "Test: Debug Nearest" })
map("n", "<leader>tS", function() require("neotest").run.stop() end, { desc = "Test: Stop" })
map("n", "<leader>ta", function() require("neotest").run.attach() end, { desc = "Test: Attach" })
map("n", "<leader>tc", "<cmd>Coverage<cr>", { desc = "Test: Show Coverage" })
map("n", "<leader>tC", "<cmd>CoverageClear<cr>", { desc = "Test: Clear Coverage" })
map("n", "<leader>tl", "<cmd>CoverageLoad<cr>", { desc = "Test: Load Coverage" })

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

-- Git (Neogit and Diffview)
map("n", "<leader>gn", "<cmd>Neogit<cr>", { desc = "Neogit: Open" })
map("n", "<leader>gc", "<cmd>Neogit commit<cr>", { desc = "Neogit: Commit" })
map("n", "<leader>gp", "<cmd>Neogit push<cr>", { desc = "Neogit: Push" })
map("n", "<leader>gl", "<cmd>Neogit pull<cr>", { desc = "Neogit: Pull" })
map("n", "<leader>gb", "<cmd>Neogit branch<cr>", { desc = "Neogit: Branch" })
map("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "Diffview: Open" })
map("n", "<leader>gq", "<cmd>DiffviewClose<cr>", { desc = "Diffview: Close" })
map("n", "<leader>gh", "<cmd>DiffviewFileHistory<cr>", { desc = "Diffview: File History" })
map("n", "<leader>gf", "<cmd>DiffviewFileHistory %<cr>", { desc = "Diffview: Current File History" })

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

-- Noice
map("c", "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, { desc = "Redirect Cmdline" })
map("n", "<leader>nl", function() require("noice").cmd("last") end, { desc = "Noice: Last Message" })
map("n", "<leader>nh", function() require("noice").cmd("history") end, { desc = "Noice: History" })
map("n", "<leader>na", function() require("noice").cmd("all") end, { desc = "Noice: All" })
map("n", "<leader>nd", function() require("noice").cmd("dismiss") end, { desc = "Noice: Dismiss All" })
map({ "i", "n", "s" }, "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, { silent = true, expr = true, desc = "Scroll forward" })
map({ "i", "n", "s" }, "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, { silent = true, expr = true, desc = "Scroll backward" })

-- Snacks (additional to those defined in plugins/ui.lua)
map("n", "<leader>z", function() Snacks.zen() end, { desc = "Toggle Zen Mode" })
map("n", "<leader>Z", function() Snacks.zen.zoom() end, { desc = "Toggle Zoom Mode" })
map("n", "<leader>bd", function() Snacks.bufdelete() end, { desc = "Delete Buffer" })
map("n", "<leader>bD", function() Snacks.bufdelete.other() end, { desc = "Delete Other Buffers" })
map("n", "<leader>n", function() Snacks.notifier.show_history() end, { desc = "Notification History" })
map("n", "<leader>un", function() Snacks.notifier.hide() end, { desc = "Hide All Notifications" })
map("n", "<leader>ud", function() Snacks.dashboard.open() end, { desc = "Open Dashboard" })
map("n", "<leader>gG", function() Snacks.lazygit() end, { desc = "Lazygit (Snacks)" })
map("n", "<leader>gf", function() Snacks.lazygit.log_file() end, { desc = "Lazygit Current File History" })
map("n", "<leader>gl", function() Snacks.lazygit.log() end, { desc = "Lazygit Log (cwd)" })
