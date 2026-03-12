local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff_format", "ruff_fix" },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  formatters = {
    ruff_format = {
      command = "ruff",
      args = { "format", "--stdin-filename", "$FILENAME", "-" },
      stdin = true,
    },
    ruff_fix = {
      command = "ruff",
      args = { "check", "--fix", "--stdin-filename", "$FILENAME", "-" },
      stdin = true,
    },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
