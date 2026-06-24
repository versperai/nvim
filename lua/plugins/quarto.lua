return {
  {
    "quarto-dev/quarto-nvim",
    dependencies = {
      "jmbuhr/otter.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    ft = { "quarto" },
    opts = {
      debug = false,
      closePreviewOnExit = true,
      lspFeatures = {
        enabled = true,
        chunks = "curly",
        languages = { "python", "bash" },
        diagnostics = {
          enabled = true,
          triggers = { "BufWritePost" },
        },
        completion = {
          enabled = true,
        },
      },
      codeRunner = {
        enabled = true,
        default_method = "molten",
        ft_runners = {
          python = "molten",
        },
        never_run = { "yaml" },
      },
    },
    -- init 在启动时执行，提前注册 .qmd 文件类型和 treesitter
    init = function()
      vim.filetype.add({
        extension = {
          qmd = "quarto",
        },
      })
      -- 让 treesitter 用 markdown 解析器处理 quarto 文件
      -- （quarto-nvim 的 ftplugin 中也有这行，但可能太晚）
      vim.treesitter.language.register("markdown", { "quarto" })
    end,
    config = function(_, opts)
      require("quarto").setup(opts)

      -- 为每个 quarto buffer 设置快捷键
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "quarto",
        callback = function()
          local runner = require("quarto.runner")
          local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = true, silent = true, desc = desc })
          end

          -- cell 执行（与 pyworks 的 <leader>j* 风格一致）
          map("n", "<leader>jj", runner.run_cell, "Run cell")
          map("n", "<leader>jl", runner.run_line, "Run line")
          map("n", "<leader>jR", runner.run_all, "Run all cells")
          map("v", "<leader>jr", runner.run_range, "Run visual range")

          -- kernel 管理
          map("n", "<leader>mi", "<cmd>MoltenInit python3<CR>", "Init kernel")
          map("n", "<leader>mr", "<cmd>MoltenRestart<CR>", "Restart kernel")
          map("n", "<leader>mx", "<cmd>MoltenInterrupt<CR>", "Interrupt")
          map("n", "<leader>jd", "<cmd>MoltenDelete<CR>", "Clear output")
        end,
      })
    end,
    keys = {
      { "<leader>qp", "<cmd>QuartoPreview<CR>", desc = "Quarto Preview" },
      { "<leader>jj", desc = "Run cell" },
      { "<leader>jl", desc = "Run line" },
      { "<leader>jR", desc = "Run all cells" },
      { "<leader>mi", desc = "Init kernel" },
    },
  },
}
