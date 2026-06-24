return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  ft = { "markdown", "quarto", "rmd" },
  opts = {
    file_types = { "markdown", "quarto" },
    latex = {
      enabled = true,
    },
  },
}
