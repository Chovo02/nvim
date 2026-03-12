return {
  -- Rainbow delimiters - Colorful nested brackets
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "BufReadPost",
    config = function()
      local rainbow_delimiters = require("rainbow-delimiters")

      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
          vim = rainbow_delimiters.strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
          lua = "rainbow-blocks",
        },
        priority = {
          [""] = 110,
          lua = 210,
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
        blacklist = {},
      }
    end,
  },

  -- Hlchunk - Indent lines and scope highlighting
  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("hlchunk").setup({
        chunk = {
          enable = true,
          priority = 15,
          style = {
            { fg = "#806d45" },
            { fg = "#c21f30" },
          },
          use_treesitter = true,
          chars = {
            horizontal_line = "─",
            vertical_line = "│",
            left_top = "┌",
            left_bottom = "└",
            right_arrow = ">",
          },
          textobject = "ic",
          max_file_size = 1024 * 1024,
          error_sign = true,
          duration = 200,
          delay = 100,
        },
        indent = {
          enable = false, -- Disabled since we use snacks.nvim indent
          priority = 10,
          use_treesitter = false,
          chars = {
            "│",
          },
          style = {
                vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"),
          },
          ahead_lines = 5,
          delay = 100,
        },
        line_num = {
          enable = true,
          priority = 10,
          use_treesitter = true,
          style = "#806d45",
        },
        blank = {
          enable = false,
          priority = 9,
        },
      })
    end,
  },

  -- Todo comments - Highlight TODO/FIXME/etc
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      signs = true,
      sign_priority = 8,
      keywords = {
        FIX = {
          icon = " ",
          color = "error",
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
        },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        TEST = { icon = " ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      },
      gui_style = {
        fg = "NONE",
        bg = "BOLD",
      },
      merge_keywords = true,
      highlight = {
        multiline = true,
        multiline_pattern = "^.",
        multiline_context = 10,
        before = "",
        keyword = "wide",
        after = "fg",
        pattern = [[.*<(KEYWORDS)\s*:]],
        comments_only = true,
        max_line_len = 400,
        exclude = {},
      },
      colors = {
        error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
        warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
        info = { "DiagnosticInfo", "#2563EB" },
        hint = { "DiagnosticHint", "#10B981" },
        default = { "Identifier", "#7C3AED" },
        test = { "Identifier", "#FF00FF" },
      },
      search = {
        command = "rg",
        args = {
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
        },
        pattern = [[\b(KEYWORDS):]],
      },
    },
    keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
      { "<leader>td", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
      { "<leader>tD", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
      { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find Todo" },
      { "<leader>fT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Find Todo/Fix/Fixme" },
    },
  },

  -- Scrollbar - Modern scrollbar with diagnostics
  {
    "petertriho/nvim-scrollbar",
    event = "BufReadPost",
    config = function()
      require("scrollbar").setup({
        show = true,
        show_in_active_only = false,
        set_highlights = true,
        folds = 1000,
        max_lines = false,
        hide_if_all_visible = false,
        throttle_ms = 100,
        handle = {
          text = " ",
          blend = 30,
          color = nil,
          color_nr = nil,
          highlight = "CursorColumn",
          hide_if_all_visible = true,
        },
        marks = {
          Cursor = {
            text = "•",
            priority = 0,
            gui = nil,
            color = nil,
            cterm = nil,
            color_nr = nil,
            highlight = "Normal",
          },
          Search = {
            text = { "-", "=" },
            priority = 1,
            gui = nil,
            color = nil,
            cterm = nil,
            color_nr = nil,
            highlight = "Search",
          },
          Error = {
            text = { "-", "=" },
            priority = 2,
            gui = nil,
            color = nil,
            cterm = nil,
            color_nr = nil,
            highlight = "DiagnosticVirtualTextError",
          },
          Warn = {
            text = { "-", "=" },
            priority = 3,
            gui = nil,
            color = nil,
            cterm = nil,
            color_nr = nil,
            highlight = "DiagnosticVirtualTextWarn",
          },
          Info = {
            text = { "-", "=" },
            priority = 4,
            gui = nil,
            color = nil,
            cterm = nil,
            color_nr = nil,
            highlight = "DiagnosticVirtualTextInfo",
          },
          Hint = {
            text = { "-", "=" },
            priority = 5,
            gui = nil,
            color = nil,
            cterm = nil,
            color_nr = nil,
            highlight = "DiagnosticVirtualTextHint",
          },
          Misc = {
            text = { "-", "=" },
            priority = 6,
            gui = nil,
            color = nil,
            cterm = nil,
            color_nr = nil,
            highlight = "Normal",
          },
          GitAdd = {
            text = "┃",
            priority = 7,
            gui = nil,
            color = nil,
            cterm = nil,
            color_nr = nil,
            highlight = "GitSignsAdd",
          },
          GitChange = {
            text = "┃",
            priority = 7,
            gui = nil,
            color = nil,
            cterm = nil,
            color_nr = nil,
            highlight = "GitSignsChange",
          },
          GitDelete = {
            text = "▁",
            priority = 7,
            gui = nil,
            color = nil,
            cterm = nil,
            color_nr = nil,
            highlight = "GitSignsDelete",
          },
        },
        excluded_buftypes = {
          "terminal",
        },
        excluded_filetypes = {
          "cmp_docs",
          "cmp_menu",
          "noice",
          "prompt",
          "TelescopePrompt",
        },
        autocmd = {
          render = {
            "BufWinEnter",
            "TabEnter",
            "TermEnter",
            "WinEnter",
            "CmdwinLeave",
            "TextChanged",
            "VimResized",
            "WinScrolled",
          },
          clear = {
            "BufWinLeave",
            "TabLeave",
            "TermLeave",
            "WinLeave",
          },
        },
        handlers = {
          cursor = true,
          diagnostic = true,
          gitsigns = false,
          search = false,
        },
      })
    end,
  },

  -- Fidget - LSP progress notifications
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    opts = {},
  },
}
