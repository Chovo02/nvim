return {
  -- Neogit - Git interface like Magit
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    cmd = "Neogit",
    keys = {
      { "<leader>gn", "<cmd>Neogit<cr>", desc = "Neogit: Open" },
      { "<leader>gc", "<cmd>Neogit commit<cr>", desc = "Neogit: Commit" },
      { "<leader>gp", "<cmd>Neogit push<cr>", desc = "Neogit: Push" },
      { "<leader>gl", "<cmd>Neogit pull<cr>", desc = "Neogit: Pull" },
      { "<leader>gb", "<cmd>Neogit branch<cr>", desc = "Neogit: Branch" },
    },
    config = function()
      require("neogit").setup({
        disable_signs = false,
        disable_hint = true,
        disable_context_highlighting = false,
        disable_commit_confirmation = false,
        disable_insert_on_commit = "auto",
        disable_builtin_notifications = false,
        disable_show_on_open = false,
        disable_builtin_highlighting = false,
        telescope_sorter = function()
          return require("telescope").extensions.fzf.native_fzf_sorter()
        end,
        remember_settings = true,
        use_per_project_settings = true,
        ignored_settings = {
          "NeogitPushPopup--force-with-lease",
          "NeogitPushPopup--force",
          "NeogitCommitPopup--allow-empty",
          "NeogitRevertPopup--no-edit",
        },
        highlight = {
          italic = true,
          bold = true,
          underline = true,
        },
        use_default_keymaps = true,
        auto_refresh = true,
        sort_branches = "-committerdate",
        kind = "tab",
        disable_line_numbers = true,
        console_timeout = 2000,
        auto_show_console = true,
        status = {
          show_head_commit_hash = true,
          recent_commit_count = 10,
          HEAD_padding = 10,
          HEAD_folded = false,
          mode_padding = 3,
          mode_text = {
            M = "modified",
            N = "new file",
            A = "staged",
            D = "deleted",
            C = "copied",
            U = "updated",
            R = "renamed",
            DD = "unmerged",
            AU = "unmerged",
            UA = "unmerged",
            DU = "unmerged",
            UD = "unmerged",
            UU = "unmerged",
            AA = "unmerged",
          },
        },
        commit_editor = {
          kind = "auto",
        },
        commit_select_view = {
          kind = "tab",
        },
        commit_view = {
          kind = "vsplit",
          verify_commit = vim.fn.executable("gpg") == 1,
        },
        log_view = {
          kind = "tab",
        },
        rebase_editor = {
          kind = "auto",
        },
        reflog_view = {
          kind = "tab",
        },
        merge_editor = {
          kind = "auto",
        },
        description_editor = {
          kind = "auto",
        },
        tag_editor = {
          kind = "auto",
        },
        preview_buffer = {
          kind = "split",
          split_direction = "below",
        },
        popup = {
          kind = "split",
        },
        signs = {
          section = { "", "" },
          item = { "▸", "▾" },
          hunk = { "", "" },
        },
        integrations = {
          telescope = true,
          diffview = true,
        },
        sections = {
          sequencer = {
            folded = false,
            hidden = false,
          },
          untracked = {
            folded = false,
            hidden = false,
          },
          unstaged = {
            folded = false,
            hidden = false,
          },
          staged = {
            folded = false,
            hidden = false,
          },
          stashes = {
            folded = true,
            hidden = false,
          },
          unpulled_upstream = {
            folded = true,
            hidden = false,
          },
          unmerged_upstream = {
            folded = true,
            hidden = false,
          },
          unpulled_pushRemote = {
            folded = true,
            hidden = false,
          },
          unmerged_pushRemote = {
            folded = true,
            hidden = false,
          },
          recent = {
            folded = true,
            hidden = false,
          },
          rebase = {
            folded = true,
            hidden = false,
          },
        },
        mappings = {
          finder = {
            ["<cr>"] = "Select",
            ["<c-c>"] = "Close",
            ["<c-n>"] = "Next",
            ["<c-p>"] = "Previous",
            ["<down>"] = "Next",
            ["<up>"] = "Previous",
            ["<tab>"] = "MultiselectToggleNext",
            ["<s-tab>"] = "MultiselectTogglePrevious",
            ["<c-j>"] = "NOP",
          },
          status = {
            ["q"] = "Close",
            ["I"] = "InitRepo",
            ["1"] = "Depth1",
            ["2"] = "Depth2",
            ["3"] = "Depth3",
            ["4"] = "Depth4",
            ["<tab>"] = "Toggle",
            ["x"] = "Discard",
            ["s"] = "Stage",
            ["S"] = "StageUnstaged",
            ["<c-s>"] = "StageAll",
            ["u"] = "Unstage",
            ["U"] = "UnstageStaged",
            ["d"] = "DiffAtFile",
            ["D"] = "DiffAtFile",
            ["$"] = "CommandHistory",
            ["<c-r>"] = "RefreshBuffer",
            ["<enter>"] = "GoToFile",
            ["<c-v>"] = "VSplitOpen",
            ["<c-x>"] = "SplitOpen",
            ["<c-t>"] = "TabOpen",
            ["{"] = "GoToPreviousHunkHeader",
            ["}"] = "GoToNextHunkHeader",
          },
        },
      })
    end,
  },

  -- Diffview - Advanced diff viewer
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
      "DiffviewFileHistory",
    },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview: Open" },
      { "<leader>gq", "<cmd>DiffviewClose<cr>", desc = "Diffview: Close" },
      { "<leader>gh", "<cmd>DiffviewFileHistory<cr>", desc = "Diffview: File History" },
      { "<leader>gf", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview: Current File History" },
      { "<leader>gt", "<cmd>DiffviewToggleFiles<cr>", desc = "Diffview: Toggle Files" },
    },
    opts = {
      diff_binaries = false,
      enhanced_diff_hl = false,
      git_cmd = { "git" },
      use_icons = true,
      show_help_hints = true,
      watch_index = true,
      icons = {
        folder_closed = "",
        folder_open = "",
      },
      signs = {
        fold_closed = "",
        fold_open = "",
        done = "✓",
      },
      view = {
        default = {
          winbar_info = false,
        },
        merge_tool = {
          layout = "diff3_horizontal",
          disable_diagnostics = true,
          winbar_info = true,
        },
        file_history = {
          winbar_info = false,
        },
      },
      file_panel = {
        listing_style = "tree",
        tree_options = {
          flatten_dirs = true,
          folder_statuses = "only_folded",
        },
        win_config = {
          position = "left",
          width = 35,
          win_opts = {},
        },
      },
      file_history_panel = {
        log_options = {
          git = {
            single_file = {
              diff_merges = "combined",
            },
            multi_file = {
              diff_merges = "first-parent",
            },
          },
        },
        win_config = {
          position = "bottom",
          height = 16,
          win_opts = {},
        },
      },
      commit_log_panel = {
        win_config = {},
      },
      default_args = {
        DiffviewOpen = {},
        DiffviewFileHistory = {},
      },
      hooks = {},
      keymaps = {
        disable_defaults = false,
        view = {
          ["<tab>"] = "select_next_entry",
          ["<s-tab>"] = "select_prev_entry",
          ["gf"] = "goto_file",
          ["<C-w><C-f>"] = "goto_file_split",
          ["<C-w>gf"] = "goto_file_tab",
          ["<leader>e"] = "focus_files",
          ["<leader>b"] = "toggle_files",
        },
        file_panel = {
          ["j"] = "next_entry",
          ["<down>"] = "next_entry",
          ["k"] = "prev_entry",
          ["<up>"] = "prev_entry",
          ["<cr>"] = "select_entry",
          ["o"] = "select_entry",
          ["<2-LeftMouse>"] = "select_entry",
          ["-"] = "toggle_stage_entry",
          ["S"] = "stage_all",
          ["U"] = "unstage_all",
          ["X"] = "restore_entry",
          ["R"] = "refresh_files",
          ["L"] = "open_commit_log",
          ["<c-b>"] = "scroll_view_up",
          ["<c-f>"] = "scroll_view_down",
          ["<tab>"] = "select_next_entry",
          ["<s-tab>"] = "select_prev_entry",
          ["gf"] = "goto_file",
          ["<C-w><C-f>"] = "goto_file_split",
          ["<C-w>gf"] = "goto_file_tab",
          ["i"] = "listing_style",
          ["f"] = "toggle_flatten_dirs",
          ["<leader>e"] = "focus_files",
          ["<leader>b"] = "toggle_files",
        },
        file_history_panel = {
          ["g!"] = "options",
          ["<C-A-d>"] = "open_in_diffview",
          ["y"] = "copy_hash",
          ["L"] = "open_commit_log",
          ["zR"] = "open_all_folds",
          ["zM"] = "close_all_folds",
          ["j"] = "next_entry",
          ["<down>"] = "next_entry",
          ["k"] = "prev_entry",
          ["<up>"] = "prev_entry",
          ["<cr>"] = "select_entry",
          ["o"] = "select_entry",
          ["<2-LeftMouse>"] = "select_entry",
          ["<c-b>"] = "scroll_view_up",
          ["<c-f>"] = "scroll_view_down",
          ["<tab>"] = "select_next_entry",
          ["<s-tab>"] = "select_prev_entry",
          ["gf"] = "goto_file",
          ["<C-w><C-f>"] = "goto_file_split",
          ["<C-w>gf"] = "goto_file_tab",
          ["<leader>e"] = "focus_files",
          ["<leader>b"] = "toggle_files",
        },
        option_panel = {
          ["<tab>"] = "select",
          ["q"] = "close",
        },
      },
    },
  },
}
