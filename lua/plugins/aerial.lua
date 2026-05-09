return {
  "stevearc/aerial.nvim",
  -- 只有打开文件时才加载，提高启动速度
  event = "LazyFile",
  -- Optional dependencies
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    -- 对应文档推荐的配置方式
    on_attach = function(bufnr)
      -- 在当前 buffer 开启 { 和 } 的快速跳转（非常有用的功能）shift + 二者
      vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr, desc = "上一个标题" })
      vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr, desc = "下一个标题" })
    end,
    -- 确保支持 Markdown
    backends = { "treesitter", "markdown" },
    layout = {
      min_width = 28,
      default_direction = "left", -- 像 vimtex 一样放在左边
    },
    show_guides = true, -- 显示层级连接线
  },
  keys = {
    { "<leader>a", "<cmd>AerialToggle!<cr>", desc = "Aerial Toggle" },
  },
}
