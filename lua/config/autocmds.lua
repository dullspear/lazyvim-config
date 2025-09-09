-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- Add any additional autocmds here
vim.api.nvim_create_autocmd("VimEnter", {
  desc = "自动选择 Neovim 打开时的虚拟环境",
  pattern = "*",
  callback = function()
    local venv = vim.fn.findfile("pyproject.toml", vim.fn.getcwd() .. ";")
    if venv ~= "" then
      require("venv-selector").retrieve_from_cache()
    end
  end,
  once = true,
})

-- 创建一个全局自定义命令组
local config_group = vim.api.nvim_create_augroup("MyConfigGroup", {})

-- 自动打开 Neo-tree 并切换工作目录
vim.api.nvim_create_autocmd({ "User" }, {
  pattern = "SessionLoadPost",
  group = config_group,
  callback = function()
    -- 切换当前工作目录到当前文件所在目录
    local file_dir = vim.fn.expand("%:p:h")
    if vim.fn.isdirectory(file_dir) == 1 then
      vim.cmd("cd " .. file_dir)
    end

    -- 打开 Neo-tree 并展示当前文件
    require("neo-tree.command").execute({
      action = "show",
      reveal = true,
      use_cwd = true,
    })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    -- 确保是真实文件
    if vim.bo.buftype ~= "" or vim.fn.expand("%:p") == "" then
      return
    end

    -- 等待文件加载完成
    vim.defer_fn(function()
      if vim.bo.modified then
        return
      end

      local term_id = 1
      local term = require("toggleterm.terminal").get(term_id)
      if not term or not term:is_open() then
        local Terminal = require("toggleterm.terminal").Terminal
        local toggleterm1 = Terminal:new({
          id = term_id,
          hidden = true,
          direction = "horizontal",
        })

        pcall(toggleterm1.spawn, toggleterm1)
      end
    end, 200)
  end,
})
