return {
  -- Snacks.nvim - Collection of QoL plugins
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      -- Zen mode - Distraction-free coding
      zen = {
        enabled = true,
        toggles = {
          dim = true,
          git_signs = false,
          mini_diff_signs = false,
          diagnostics = false,
          indent = false,
        },
        show = {
          statusline = false,
          tabline = false,
        },
        win = {
          backdrop = { transparent = true, blend = 40 },
          width = 0.85,
        },
        zoom = {
          toggles = {},
          show = { statusline = true, tabline = true },
          win = {
            backdrop = false,
            width = 0,
          },
        },
      },

      -- Dashboard - Beautiful startup screen
      dashboard = {
        enabled = true,
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
        },
        preset = {
          keys = {
            { icon = "", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = "", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = "", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = "", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = "", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
            { icon = "", key = "s", desc = "Restore Session", section = "session" },
            { icon = "", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
            { icon = "", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = "", key = "q", desc = "Quit", action = ":qa" },
          },
        },
      },

      -- Bigfile - Deal with big files
      bigfile = {
        enabled = true,
        notify = true,
        size = 1.5 * 1024 * 1024, -- 1.5MB
        line_length = 1000,
        setup = function(ctx)
          vim.b.minianimate_disable = true
          vim.b.snacks_scroll = false
          vim.schedule(function()
            vim.bo[ctx.buf].syntax = ctx.ft
          end)
        end,
      },

      -- Bufdelete - Delete buffers without disrupting layout
      bufdelete = {
        enabled = true,
      },

      -- Notifier - Modern notifications
      notifier = {
        enabled = true,
        timeout = 3000,
        width = { min = 40, max = 0.4 },
        height = { min = 1, max = 0.6 },
        margin = { top = 0, right = 1, bottom = 0 },
        padding = true,
        sort = { "level", "added" },
        level = vim.log.levels.TRACE,
        icons = {
          debug = "",
          error = "",
          info = "",
          trace = "",
          warn = "",
        },
        style = "compact",
        top_down = true,
        date_format = "%H:%M",
        more_format = " ↓ %d lines ",
        keep = function(notif)
          return vim.fn.getcmdpos() == 0
        end,
      },

      -- Indent - Indent guides and scopes
      indent = {
        enabled = true,
        priority = 1,
        char = "│",
        only_scope = false,
        only_current = false,
        hl = "SnacksIndent",
        indent = {
          hl = "SnacksIndent",
          char = "│",
        },
        scope = {
          hl = "SnacksIndentScope",
          char = "│",
          underline = false,
        },
        chunk = {
          hl = "SnacksIndentChunk",
          char = {
            corner_top = "┌",
            corner_bottom = "└",
            horizontal = "─",
            vertical = "│",
            arrow = ">",
          },
          enabled = false,
          only_current = false,
        },
        animate = {
          enabled = true,
          style = "out",
          easing = "linear",
          duration = {
            step = 20,
            total = 500,
          },
        },
        filter = function(buf)
          return vim.g.snacks_indent ~= false and vim.b[buf].snacks_indent ~= false and vim.bo[buf].buftype == ""
        end,
      },

      -- Input - Better vim.ui.input
      input = {
        enabled = true,
        icon = "",
        icon_hl = "SnacksInputIcon",
        win = {
          relative = "cursor",
          row = -3,
          col = 0,
          width = 30,
        },
      },

      -- Quickfile - Fast file rendering
      quickfile = {
        enabled = true,
        exclude = { "latex" },
      },

      -- Statuscolumn - Better status column
      statuscolumn = {
        enabled = true,
        left = { "mark", "sign" },
        right = { "fold", "git" },
        folds = {
          open = true,
          git_hl = false,
        },
        git = {
          patterns = { "GitSign", "MiniDiffSign" },
        },
        refresh = 50,
      },

      -- Scope - Scope detection
      scope = {
        enabled = false,
      },

      -- Scroll - Smooth scrolling
      scroll = {
        enabled = true,
        animate = {
          duration = { step = 15, total = 250 },
          easing = "linear",
        },
        animate_repeat = {
          delay = 100,
          duration = { step = 5, total = 50 },
          easing = "linear",
        },
        faster = 1.5,
      },

      -- Words - Highlight word under cursor
      words = {
        enabled = true,
        debounce = 200,
        notify_jump = false,
        notify_end = true,
        fold_open = true,
        jumplist = true,
        modes = { "n", "i", "c" },
      },
    },
    keys = {
      -- Zen mode
      { "<leader>z", function() Snacks.zen() end, desc = "Toggle Zen Mode" },
      { "<leader>Z", function() Snacks.zen.zoom() end, desc = "Toggle Zoom Mode" },
      
      -- Buffer delete
      { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
      { "<leader>bD", function() Snacks.bufdelete.other() end, desc = "Delete Other Buffers" },
      
      -- Notifications
      { "<leader>n", function() Snacks.notifier.show_history() end, desc = "Notification History" },
      { "<leader>un", function() Snacks.notifier.hide() end, desc = "Hide All Notifications" },
      
      -- Dashboard
      { "<leader>ud", function() Snacks.dashboard.open() end, desc = "Open Dashboard" },
      
      -- Lazygit (optional - if not using toggleterm)
      { "<leader>gG", function() Snacks.lazygit() end, desc = "Lazygit (Snacks)" },
      { "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" },
      { "<leader>gl", function() Snacks.lazygit.log() end, desc = "Lazygit Log (cwd)" },
    },
  },
}
