return {
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap",
      "mfussenegger/nvim-dap-python", -- optional
      {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = { "nvim-lua/plenary.nvim" },
      },
    },
    lazy = false,
    branch = "regexp",
    config = function()
      require("venv-selector").setup({
        settings = {
          search = {
            find_code_venvs = {
              -- 使用双反斜杠转义
              command = [[fd -H -I "python.exe$" C:\\special\\Python311]],
            },
            find_programming_venvs = {
              command = [[fd -H -I "python.exe$" D:\\py_project]],
            },
            anaconda_base = {
              command = [[fd -H -I "python.exe$" C:\\Users\\sxy\\.conda\\envs]],
              type = "anaconda",
            },
            poetry_base = {
              -- 指定查找 .venv 文件夹中的 python.exe
              command = [[fd -H -I "python.exe$" D:\\]],
              type = "poetry",
            },
          },
        },
      })
    end,
    keys = {
      { ",v", "<cmd>VenvSelect<cr>", desc = "Select VirtualEnv" },
      { "<leader>vs", "<cmd>VenvSelect<cr>", desc = "Select VirtualEnv" },
      { "<leader>vc", "<cmd>VenvSelectCached<cr>", desc = "Select Cached VirtualEnv" },
    },
  },
}
