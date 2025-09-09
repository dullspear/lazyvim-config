-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Set default directory
vim.opt.autochdir = true
-- windows下使用undotree需要指定diff linuix需要删除下面的代码
vim.g.undotree_DiffCommand = "FC"
