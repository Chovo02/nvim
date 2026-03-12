return {
  -- Neotest - Testing Framework
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-python",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-python")({
            dap = { justMyCode = false },
            runner = "pytest",
            python = ".venv/bin/python",
            pytest_discover_instances = true,
          }),
        },
        status = { virtual_text = true },
        output = { open_on_run = true },
        quickfix = {
          open = function()
            vim.cmd("copen")
          end,
        },
      })
    end,
    keys = {
      { "<leader>tt", function() require("neotest").run.run() end, desc = "Test: Run Nearest" },
      { "<leader>tT", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Test: Run File" },
      { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Test: Toggle Summary" },
      { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Test: Show Output" },
      { "<leader>tO", function() require("neotest").output_panel.toggle() end, desc = "Test: Toggle Output Panel" },
      { "<leader>td", function() require("neotest").run.run({ strategy = "dap" }) end, desc = "Test: Debug Nearest" },
      { "<leader>tS", function() require("neotest").run.stop() end, desc = "Test: Stop" },
      { "<leader>ta", function() require("neotest").run.attach() end, desc = "Test: Attach" },
    },
  },

  -- Neotest Python Adapter
  {
    "nvim-neotest/neotest-python",
    dependencies = { "nvim-neotest/neotest" },
  },

  -- Test Coverage
  {
    "andythigpen/nvim-coverage",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("coverage").setup({
        auto_reload = true,
        lcov_file = "./coverage/lcov.info",
        highlights = {
          covered = { fg = "#98c379" },
          uncovered = { fg = "#e06c75" },
        },
        signs = {
          covered = { text = "▸" },
          uncovered = { text = "▸" },
        },
      })
    end,
    keys = {
      { "<leader>tc", "<cmd>Coverage<cr>", desc = "Test: Show Coverage" },
      { "<leader>tC", "<cmd>CoverageClear<cr>", desc = "Test: Clear Coverage" },
      { "<leader>tl", "<cmd>CoverageLoad<cr>", desc = "Test: Load Coverage" },
    },
  },
}
