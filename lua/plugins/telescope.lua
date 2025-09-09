return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-project.nvim",
  },
  config = function()
    require("telescope").setup({
      extensions = {
        project = {
          base_dirs = {
            { path = "D:\\pycode", max_depth = 2 }, -- 设置工作区路径并指定搜索深度
            -- 可以继续添加其他工作区路径
            -- { path = "~/projects/other_project", max_depth = 2 },
          },
          hidden_files = true, -- 是否显示隐藏文件
        },
      },
    })

    -- 加载项目扩展
    require("telescope").load_extension("project")

    -- 绑定按键以查找项目
    vim.keymap.set("n", "<leader>fp", ":Telescope project<CR>", { desc = "查找项目" })
  end,
  keys = {
    -- 禁用默认文件搜索快捷键
    { "<leader><space>", false },
    -- 禁用默认文件内容搜索快捷键
    { "<leader>/", false },
    -- 修改文件查找快捷键
    {
      "<leader>ff",
      function()
        require("telescope.builtin").find_files()
      end,
      desc = "查找文件",
    },
    {
      "<leader>fF",
      function()
        require("telescope.builtin").find_files({ hidden = true, no_ignore = true })
      end,
      desc = "查找所有文件（包括隐藏文件）",
    },
    {
      "<leader>fw",
      function()
        require("telescope.builtin").live_grep()
      end,
      desc = "查找关键词",
    },
    {
      "<leader>fW",
      function()
        require("telescope.builtin").live_grep({
          additional_args = function(args)
            return vim.list_extend(args, { "--hidden", "--no-ignore" })
          end,
        })
      end,
      desc = "查找关键词（包括隐藏文件）",
    },
    {
      "<leader>fc",
      function()
        require("telescope.builtin").commands()
      end,
      desc = "查找命令",
    },
    {
      "<leader>fC",
      function()
        require("telescope.builtin").grep_string()
      end,
      desc = "查找光标下的单词",
    },
    {
      "<leader>fb",
      function()
        require("telescope.builtin").buffers()
      end,
      desc = "查找缓冲区",
    },
  },
}
