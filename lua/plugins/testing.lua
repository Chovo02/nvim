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

  },
}
