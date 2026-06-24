return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    -- 支持 quarto (.qmd) 文件
    file_types = { "markdown", "quarto" },
    -- 启用数学公式渲染（$...$ / $$...$$）
    latex = {
      enabled = true,
    },
  },
}
