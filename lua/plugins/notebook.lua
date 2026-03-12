return {
  -- Jupytext - Convert ipynb to Python
  {
    "GCBallesteros/jupytext.nvim",
    lazy = false,
    opts = {
      style = "hydrogen",
      output_extension = "auto",
      force_ft = nil,
      custom_languages = {},
    },
  },

  -- Image.nvim - Required for molten image rendering (WezTerm compatible)
  {
    "3rd/image.nvim",
    build = false, -- Disable luarocks build, use default
    lazy = true,
    ft = { "python", "jupyter", "markdown" },
    opts = {
      backend = "kitty", -- WezTerm supports Kitty Graphics Protocol
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          filetypes = { "markdown", "vimwiki" },
        },
        neorg = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          filetypes = { "norg" },
        },
      },
      max_width = nil,
      max_height = nil,
      max_width_window_percentage = nil,
      max_height_window_percentage = 50,
      kitty_method = "normal",
      kitty_tmux_write_delay = 10,
      window_overlap_clear_enabled = false,
      window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
      editor_only_render_when_focused = false,
      tmux_show_only_in_active_window = false,
      hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" },
    },
  },

  -- Molten - Jupyter kernel execution with image support
  {
    "benlubas/molten-nvim",
    build = ":UpdateRemotePlugins",
    dependencies = { "3rd/image.nvim" },
    ft = { "python", "jupyter" },
    init = function()
      -- Setup molten globals with image support
      vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_output_win_max_height = 20
      vim.g.molten_auto_open_output = false
      vim.g.molten_wrap_output = true
      vim.g.molten_virt_text_output = true
      vim.g.molten_virt_lines_off_by_1 = true
      vim.g.molten_tick_rate = 500
    end,
    keys = {
      { "<leader>mi", "<cmd>MoltenInit<cr>", desc = "Molten: Init Kernel" },
      { "<leader>mr", "<cmd>MoltenEvaluateCell<cr>", desc = "Molten: Run Cell" },
      { "<leader>mv", ":MoltenEvaluateVisual<cr>", mode = "v", desc = "Molten: Run Visual" },
      { "<leader>mo", "<cmd>MoltenEnterOutput<cr>", desc = "Molten: Enter Output" },
      { "<leader>mh", "<cmd>MoltenHideOutput<cr>", desc = "Molten: Hide Output" },
      { "<leader>md", "<cmd>MoltenDelete<cr>", desc = "Molten: Delete Cell" },
      { "<leader>mc", "<cmd>MoltenChange<cr>", desc = "Molten: Change Cell Type" },
      { "<leader>mn", "<cmd>MoltenNext<cr>", desc = "Molten: Next Cell" },
      { "<leader>mp", "<cmd>MoltenPrev<cr>", desc = "Molten: Previous Cell" },
      { "<leader>ms", "<cmd>MoltenRestart<cr>", desc = "Molten: Restart Kernel" },
    },
  },
}
