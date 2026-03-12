return {
  -- Catppuccin theme (must be first to override NvChad default)
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        background = {
          light = "latte",
          dark = "mocha",
        },
        transparent_background = false,
        show_end_of_buffer = false,
        term_colors = true,
        dim_inactive = {
          enabled = false,
          shade = "dark",
          percentage = 0.15,
        },
        no_italic = false,
        no_bold = false,
        no_underline = false,
        styles = {
          comments = { "italic" },
          conditionals = { "italic" },
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },
        color_overrides = {},
        custom_highlights = {},
        default_integrations = true,
        integrations = {
          aerial = true,
          alpha = true,
          cmp = true,
          dashboard = true,
          flash = true,
          fzf = true,
          grug_far = true,
          gitsigns = true,
          headlines = true,
          illuminate = true,
          indent_blankline = { enabled = true, scope_color = "" },
          leap = true,
          lsp_trouble = true,
          mason = true,
          markdown = true,
          mini = true,
          native_lsp = {
            enabled = true,
            underlines = {
              errors = { "underline" },
              hints = { "underline" },
              warnings = { "underline" },
              information = { "underline" },
              ok = { "underline" },
            },
            inlay_hints = {
              background = true,
            },
          },
          navic = { enabled = true, custom_bg = "lualine" },
          neotest = true,
          neogit = true,
          noice = true,
          notify = true,
          nvimtree = true,
          overseer = true,
          rainbow_delimiters = true,
          snacks = true,
          semantic_tokens = true,
          telescope = {
            enabled = true,
            style = "nvchad",
          },
          treesitter = true,
          treesitter_context = true,
          which_key = true,
        },
      })
      vim.cmd.colorscheme "catppuccin"
    end,
  },

  -- Load NvChad plugins (do this after theme)
  { import = "nvchad.plugins" },

  -- Load custom plugin configurations
  { import = "plugins.python" },
  { import = "plugins.debug" },
  { import = "plugins.ai" },
  { import = "plugins.testing" },
  { import = "plugins.tools" },
  { import = "plugins.git" },
  { import = "plugins.diagnostics" },
  { import = "plugins.notebook" },
  { import = "plugins.ui" },
  { import = "plugins.aesthetics" },
  { import = "plugins.noice" },

  -- Formatting
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
}
