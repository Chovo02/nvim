return {
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim" },
    opts = {
      name = { "venv", ".venv", "env", ".env" },
      auto_refresh = true,
    },
    keys = {
      { "<leader>pv", "<cmd>VenvSelect<cr>", desc = "Select VirtualEnv" },
      { "<leader>pc", "<cmd>VenvSelectCurrent<cr>", desc = "Show current VirtualEnv" },
    },
  },
  {
    "mfussenegger/nvim-dap-python",
    dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" },
    ft = "python",
    config = function()
      -- Usa il debugpy del venv corrente o quello di mason
      require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
    end,
    keys = {
      { "<leader>dPt", function() require("dap-python").test_method() end, desc = "Debug test method" },
      { "<leader>dPc", function() require("dap-python").test_class() end, desc = "Debug test class" },
    },
  },
}
