-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- own keymaps

vim.g.mapleader = " "

local keymap = vim.keymap
local api = vim.api

-- ----------------------------- 插入模式 ------------------------------ --
keymap.set("i", "jk", "<ESC>")
keymap.set("i", "kj", "<Enter>")

-- ----------------------------- 终端模式 ------------------------------ --
-- 在 Normal 模式下按 t 进入终端模式
api.nvim_set_keymap("n", "t", ":terminal<CR>", { noremap = true, silent = true })
-- 终端模式下按 jk 退出终端，按 kj 回车
api.nvim_set_keymap("t", "jk", "<C-\\><C-N>", { noremap = true, silent = true }) -- 退出终端模式
api.nvim_set_keymap("t", "kj", "<CR>", { noremap = true, silent = true }) -- 按 Enter

-- ----------------------------- 视觉模式 ------------------------------ --
-- dd 选块删除
-- y 选块复制
-- v + 移动光标选中 代码块 + Shift 移动键
-- ctrl u/d 滚动更多 比 hjkl 更快

keymap.set("v", "jk", "<ESC>")
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- ----------------------------- 正常模式 ------------------------------ --
-- dd 删除单行
-- Shift h / l 到顶部底部
-- 窗口
keymap.set("n", "<leader>sv", "<C-w>v") -- 水平新增窗口 split vertical
keymap.set("n", "<leader>sh", "<C-w>s") -- 垂直新增窗口 split horizontal

-- visual 模式选中 代码块后 按住 ctrl 再 jk 把它直接上下移动
-- ctrl 能从 目录区域放到 代码区域, shift 切换当前的代码区域里的这些标签页, <leader> b d 关闭当前缓冲区(就是当前在看的标签页) buffer delete

-- ----------------------------- Python ------------------------------ --
-- -- molten
