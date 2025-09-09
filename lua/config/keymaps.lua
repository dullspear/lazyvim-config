-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local map = vim.keymap.set
local unmap = vim.keymap.del

-- unmap("n", "<leader><space>", { desc = "Find Files (root dir)" })
unmap("n", "<leader>l", { desc = "Lazy" })
unmap("n", "<c-/>", { desc = "Terminal (Root Dir)" })

-- for hop.nvim
local hop = require("hop")
local directions = require("hop.hint").HintDirection
local positions = require("hop.hint").HintPosition
-- leader leader w
map({ "n", "v" }, "<leader><leader>w", function()
  hop.hint_words({ direction = directions.AFTER_CURSOR })
end, { desc = "Go to next any begining of words" })
-- leader leader e
map({ "n", "v" }, "<leader><leader>e", function()
  hop.hint_words({ direction = directions.AFTER_CURSOR, hint_position = positions.END })
end, { desc = "Go to next any end of words" })
-- leader leader b
map({ "n", "v" }, "<leader><leader>b", function()
  hop.hint_words({ direction = directions.BEFORE_CURSOR })
end, { desc = "Go to previous any begining of words" })
-- leader leader v
map({ "n", "v" }, "<leader><leader>v", function()
  hop.hint_words({ direction = directions.BEFORE_CURSOR, hint_position = positions.END })
end, { desc = "Go to previous any end of words" })
-- leader leader l
map({ "n", "v" }, "<leader><leader>l", function()
  hop.hint_camel_case({ direction = directions.AFTER_CURSOR })
end, { desc = "Go to next any begining of words considering camel case." })
-- leader leader h
map({ "n", "v" }, "<leader><leader>h", function()
  hop.hint_camel_case({ direction = directions.BEFORE_CURSOR })
end, { desc = "Go to next any begining of words considering camel case." })

-- suppress useless warning here
---@diagnostic disable: missing-fields
-- leader leader a
map({ "n", "v" }, "<leader><leader>a", function()
  hop.hint_anywhere({})
end, { desc = "Go to any char" })
---@diagnostic enable: missing-fields

-- leader leader j
map({ "n", "v" }, "<leader><leader>j", function()
  hop.hint_lines({ direction = directions.AFTER_CURSOR })
end, { desc = "Go to line below" })
-- leader leader k
map({ "n", "v" }, "<leader><leader>k", function()
  hop.hint_lines({ direction = directions.BEFORE_CURSOR })
end, { desc = "Go to line above" })

-- 解决 visual 选中粘贴替换只能粘贴一次的问题
map("x", "p", "P")

-- 在插入模式下按 Ctrl-v 粘贴
vim.api.nvim_set_keymap("i", "<C-v>", "<Esc>:normal! gP<CR>a", { noremap = true, silent = true })
-- 在可视模式下按 Ctrl-v 粘贴
vim.api.nvim_set_keymap("v", "<C-v>", '"_dP', { noremap = true, silent = true })

-- 进入块视图模式的映射：按 Alt-v（A-v）
vim.api.nvim_set_keymap("n", "<A-v>", "<C-v>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-v>", "<Esc><C-v>", { noremap = true, silent = true })

-- Ctrl-a 全选
vim.api.nvim_set_keymap("n", "<C-a>", "ggVG", { noremap = true, silent = true })

-- 在正常模式下，使用z寄存器进行复制粘贴
vim.keymap.set("n", "<C-d>", '"zyy"zp$a', { noremap = true, silent = true })

-- 在插入模式下，退出插入模式后使用z寄存器进行复制粘贴
vim.keymap.set("i", "<C-d>", '<Esc>"zyy"zp$a', { noremap = true, silent = true })

-- 视觉模式 多行移动 --
-- 移动行的映射
-- vim.keymap.set("n", "J", "<cmd>m .+2<cr>==", { desc = "Move down" })
-- vim.keymap.set("n", "K", "<cmd>m .-2<cr>==", { desc = "Move up" })

vim.keymap.set("i", "J", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
vim.keymap.set("i", "K", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })

vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move down" })
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- 退出终端模式
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

vim.keymap.set({ "n", "i" }, "<F5>", '<Cmd>write | TermExec cmd="python %"<CR>')

vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], { noremap = true, silent = true })
vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], { noremap = true, silent = true })
vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], { noremap = true, silent = true })
vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], { noremap = true, silent = true })
vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], { noremap = true, silent = true })

-- 在视觉模式下使用 Tab 向右缩进
vim.keymap.set("v", "<Tab>", ">gv", { silent = true })

-- 在视觉模式下使用 Shift + Tab 向左缩进
vim.keymap.set("v", "<S-Tab>", "<gv", { silent = true })

-- 你还可以考虑在普通模式下也做类似的映射
vim.keymap.set("n", "<Tab>", ">>", { silent = true })
vim.keymap.set("n", "<S-Tab>", "<<", { silent = true })

-- for persisted
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope persisted<cr>", { desc = "Search history sessions" })

-- Undotree
vim.keymap.set("n", "<Leader><F6>", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })

-- 复制（在视觉模式和普通模式下使用 Ctrl + C）
vim.keymap.set({ "n", "v" }, "<C-c>", '"+y', { desc = "Copy to system clipboard" })

-- 注释/取消注释选中行（多行支持）使用 Ctrl + / （需要确保没有与终端的冲突）
-- -- 若要取消原有的终端映射，确保 Ctrl + / 在 LazyVim 中没有其他用途

-- Visual 模式下的注释快捷键
vim.keymap.set("v", "<C-/>", "gc", { remap = true, silent = true })

-- Normal 模式下的注释快捷键
vim.keymap.set("n", "<C-/>", "gcc", { remap = true, silent = true })

-- Insert 模式下的注释快捷键（切换到 Normal 模式注释并返回 Insert 模式）
vim.keymap.set("i", "<C-/>", "<Esc>gccA", { remap = true, silent = true })

-- d不保存寄存器
vim.keymap.set({ "n", "v" }, "d", '"_d', { noremap = true, silent = true })

-- 关闭所有终端
function _G.close_all_terminals()
  -- 获取所有打开的终端窗口
  local terminals = vim.api.nvim_list_wins()
  for _, win in ipairs(terminals) do
    local buf = vim.api.nvim_win_get_buf(win)
    -- 判断当前缓冲区是否是一个终端缓冲区
    if vim.bo[buf].filetype == "toggleterm" then
      -- 关闭终端
      vim.api.nvim_win_close(win, true)
    end
  end
end

-- 设置快捷键触发关闭所有终端
vim.keymap.set("n", "<Leader>tC", "<Cmd>lua close_all_terminals()<CR>", { desc = "关闭所有终端" })

-- 隐藏所有终端
function _G.hide_all_terminals()
  -- 获取所有打开的终端窗口
  local terminals = vim.api.nvim_list_wins()
  for _, win in ipairs(terminals) do
    local buf = vim.api.nvim_win_get_buf(win)
    -- 判断当前缓冲区是否是一个终端缓冲区
    if vim.bo[buf].filetype == "toggleterm" then
      -- 隐藏终端窗口
      vim.api.nvim_win_hide(win)
    end
  end
end

-- 设置快捷键触发隐藏所有终端
vim.keymap.set("n", "<Leader>tH", "<Cmd>lua hide_all_terminals()<CR>", { desc = "隐藏所有终端" })

vim.keymap.set("n", "<Leader>t1", "<Cmd>ToggleTerm 1<CR>", { desc = "Open terminal 1" })
vim.keymap.set("n", "<Leader>t2", "<Cmd>ToggleTerm 2<CR>", { desc = "Open terminal 2" })
vim.keymap.set("n", "<Leader>tc", "<C-\\><C-n>:q<CR>", { silent = true, desc = "关闭当前终端" })

vim.api.nvim_set_keymap("n", "<Leader>h", ":enew<CR>:Dashboard<CR>", { noremap = true, silent = true })

-- 绑定快捷键 <leader>l 来加载会话
vim.keymap.set("n", "<leader>l", ":SessionManager load_session<CR>", { desc = "Load Session" })
