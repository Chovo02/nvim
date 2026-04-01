-- plugins/heirline.lua
return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    local venv_component = {
      condition = function() return vim.bo.filetype == "python" end,
      provider = function()
        local venv = vim.env.VIRTUAL_ENV or vim.env.CONDA_PREFIX
        if not venv then return "" end
        local name = venv:match "([^/]+)[/]?$"
        return "  " .. name .. " "
      end,
      hl = { fg = "#a8cc8c", bold = true },
    }

    table.insert(opts.statusline, #opts.statusline, venv_component)
    return opts
  end,
}
