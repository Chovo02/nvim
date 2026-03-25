return {
  -- Treesitter Python
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "python", "toml" })
    end,
  },



  -- Virtual Environment Selector
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap-python",
      "nvim-telescope/telescope.nvim",
    },
    lazy = false,

    opts = {
      settings = {
        options = {
          notify_user_on_venv_activation = true,
        },
        search = {
          anaconda = { enable = false },
          miniconda = { enable = false },
        },
      },
    },
  },

  -- Mason tool installer for Python tools
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        "pyright",
        "ruff",
        "debugpy",
      },
    },
  },
}
