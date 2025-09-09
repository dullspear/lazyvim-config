return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<C-t>]], -- 打开终端的快捷键
      start_in_insert = true, -- 打开终端后进入插入模式
      direction = "horizontal", -- 终端在当前 buffer 下方打开
      shell = "pwsh", -- 设置终端为 PowerShell 7 (pwsh)
    })
  end,
}
