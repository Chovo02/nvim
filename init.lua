vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then

  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
},  lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

require("mason").setup()
require('gitsigns').setup()
require("mason-lspconfig").setup {
    ensure_installed = { "pyright" },
}
local config = require("lspconfig.configs")
local on_attach = config.on_attach
local capabilities = config.capabilities

require("lspconfig").pyright.setup{
  on_attach = on_attach,
  settings = {
    pyright = {
      autoImportCompletion = true,
      },
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = 'openFilesOnly',
        useLibraryCodeForTypes = true,
        typeCheckingMode = 'off'
        }
      }
    }
  }
require("lspconfig").lua_ls.setup{
  on_attach = on_attach,
  cababilities = capabilities,
}
vim.schedule(function()
  require "mappings"
end)
