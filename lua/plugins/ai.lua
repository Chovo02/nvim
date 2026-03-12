return {
  -- Supermaven - AI Autocomplete
  {
    "supermaven-inc/supermaven-nvim",
    event = "InsertEnter",
    opts = {
      keymaps = {
        accept_suggestion = "<Tab>",
        clear_suggestion = "<C-]>",
        accept_word = "<C-j>",
      },
      ignore_filetypes = {},
      color = {
        suggestion_color = "#808080",
        cterm = 244,
      },
      log_level = "info",
      disable_inline_completion = false,
      disable_keymaps = false,
    },
  },

  -- Opencode.nvim - AI Agent
  {
    "nickjvandyke/opencode.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "folke/snacks.nvim",
    },
    lazy = true,
    keys = {
      { "<leader>ai", function() require("opencode").ask() end, desc = "Opencode Chat" },
      { "<leader>as", function() require("opencode").select() end, desc = "Opencode Select" },
      { "<leader>at", function() require("opencode").toggle() end, desc = "Opencode Toggle" },
      { "<leader>aa", function() require("opencode").ask("@this: ", { submit = true }) end, mode = { "n", "x" }, desc = "Opencode Ask This" },
    },
    config = function()
      vim.g.opencode_opts = {
        -- Your configuration here
      }
      vim.o.autoread = true -- Required for auto-reload on edits
    end,
  },
}
