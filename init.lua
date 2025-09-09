-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- 设置 Neovide 字体为 MesloLGS NF
vim.o.guifont = "MesloLGS NF:h14"

-- 当文件被外部程序修改时，自动加载
vim.o.autoread = true
vim.bo.autoread = true

-- 鼠标支持
vim.o.mouse = "a"

-- 自动补全不自动选中
vim.g.completeopt = "menu,menuone,noselect,noinsert"
