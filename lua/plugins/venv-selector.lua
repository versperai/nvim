return {
  {
    "linux-cultist/venv-selector.nvim",
    -- 显式指定触发条件
    ft = "python",
    cmd = "VenvSelect",
    opts = {
      name = { "venv", ".venv" },
      auto_refresh = true,
    },
    -- 绑定快捷键，按下时也会自动加载插件
    keys = {
      { "<leader>vs", "<cmd>VenvSelect<cr>", desc = "Select VirtualEnv" },
    },
  },
}
