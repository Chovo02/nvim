return {
  -- Toggleterm - Terminal management + Lazygit
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    cmd = { "ToggleTerm", "LazyGit", "LazyDocker" },
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "Toggle Lazygit" },
      { "<leader>ld", "<cmd>LazyDocker<cr>", desc = "Toggle Lazydocker" },
      { "<leader>tt", "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle Floating Terminal" },
      { "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Toggle Horizontal Terminal" },
      { "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Toggle Vertical Terminal" },
    },
    config = function()
      require("toggleterm").setup({
        size = function(term)
          if term.direction == "horizontal" then
            return 15
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
          end
        end,
        open_mapping = [[<c-\>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        terminal_mappings = true,
        persist_size = true,
        direction = "float",
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          border = "curved",
          winblend = 0,
          highlights = {
            border = "Normal",
            background = "Normal",
          },
        },
      })

      -- LazyGit terminal
      local Terminal = require("toggleterm.terminal").Terminal
      
      local lazygit = Terminal:new({
        cmd = "lazygit",
        dir = "git_dir",
        direction = "float",
        float_opts = {
          border = "curved",
        },
        on_open = function(term)
          vim.cmd("startinsert!")
          vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
        end,
        on_close = function()
          vim.cmd("startinsert!")
        end,
      })

      function _lazygit_toggle()
        lazygit:toggle()
      end

      vim.api.nvim_create_user_command("LazyGit", function()
        _lazygit_toggle()
      end, {})

      -- Lazydocker terminal
      local lazydocker = Terminal:new({
        cmd = "lazydocker",
        direction = "float",
        float_opts = {
          border = "curved",
        },
        on_open = function(term)
          vim.cmd("startinsert!")
          vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
        end,
        on_close = function()
          vim.cmd("startinsert!")
        end,
      })

      function _lazydocker_toggle()
        lazydocker:toggle()
      end

      vim.api.nvim_create_user_command("LazyDocker", function()
        _lazydocker_toggle()
      end, {})
    end,
  },

  -- Overseer - Task Runner
  {
    "stevearc/overseer.nvim",
    cmd = {
      "OverseerOpen",
      "OverseerClose",
      "OverseerToggle",
      "OverseerRun",
      "OverseerBuild",
      "OverseerQuickAction",
      "OverseerTaskAction",
    },
    keys = {
      { "<leader>or", "<cmd>OverseerRun<cr>", desc = "Overseer: Run Task" },
      { "<leader>ot", "<cmd>OverseerToggle<cr>", desc = "Overseer: Toggle Panel" },
      { "<leader>ob", "<cmd>OverseerBuild<cr>", desc = "Overseer: Build" },
      { "<leader>oc", "<cmd>OverseerQuickAction<cr>", desc = "Overseer: Quick Action" },
      { "<leader>oa", "<cmd>OverseerTaskAction<cr>", desc = "Overseer: Task Action" },
    },
    opts = {
      task_list = {
        default_detail = 1,
        max_width = { 100, 0.2 },
        min_width = { 40, 0.1 },
        width = 50,
        max_height = { 20, 0.1 },
        min_height = 8,
        height = 12,
        separator = "───",
        direction = "bottom",
        bindings = {
          ["?"] = "ShowHelp",
          ["g?"] = "ShowHelp",
          ["<CR>"] = "RunAction",
          ["<C-e>"] = "Edit",
          ["o"] = "Open",
          ["<C-v>"] = "OpenVsplit",
          ["<C-s>"] = "OpenSplit",
          ["<C-f>"] = "OpenFloat",
          ["p"] = "TogglePreview",
          ["<C-l>"] = "IncreaseDetail",
          ["<C-h>"] = "DecreaseDetail",
          ["L"] = "IncreaseAllDetail",
          ["H"] = "DecreaseAllDetail",
          ["["] = "DecreaseWidth",
          ["]"] = "IncreaseWidth",
          ["{"] = "PrevTask",
          ["}"] = "NextTask",
          ["<C-k>"] = "ScrollOutputUp",
          ["<C-j>"] = "ScrollOutputDown",
          ["q"] = "Close",
        },
      },
      task_launcher = {
        bindings = {
          ["<C-s>"] = "Submit",
          ["<C-c>"] = "Cancel",
        },
      },
      task_editor = {
        bindings = {
          ["<CR>"] = "Submit",
          ["<C-s>"] = "Submit",
          ["<C-c>"] = "Cancel",
        },
      },
      form = {
        win_opts = {
          winblend = 0,
        },
      },
      confirm = {
        win_opts = {
          winblend = 0,
        },
      },
      task_win = {
        win_opts = {
          winblend = 0,
        },
      },
      help_win = {
        win_opts = {
          winblend = 0,
        },
      },
      templates = {
        "builtin",
        "user.run_script",
        "user.run_python",
      },
    },
  },
}
