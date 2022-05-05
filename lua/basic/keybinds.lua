local utils = require("core.utils")
local map = utils.map
local cmd = vim.cmd;
local user_cmd = vim.api.nvim_create_user_command

-- v模式粘贴后不会替换剪贴板内容了
map("v", "p", "p:let @+=@0<CR>")
map({ "n", "x", "o" }, "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
map({ "n", "x", "o" }, "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
map("", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
map("", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })

-- ESC消除高亮
map("n", "<ESC>", "<cmd> :noh <CR>")
-- 插入模式移动光标
map("i", "<C-h>", "<Left>")
map("i", "<C-l>", "<Right>")
map("i", "<C-j>", "<Down>")
map("i", "<C-k>", "<Up>")
-- 行首行尾
map("i", "<C-e>", "<End>")
map("i", "<C-a>", "<ESC>^i")
-- 快速窗口切换
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
-- 缓冲区切换
map("n", "<C-k>", "<cmd> :bprev<CR>")
map("n", "<C-j>", "<cmd> :bnext<CR>")
-- normal模式下空格选中单个词语
map("n", "<Space>", "viw")
-- shift tab绑定按键+
map('i', '<S-Tab>', '<C-d>')
map('n', '<S-Tab>', '<<')
-- shift enter绑定 (仅在带GUI的终端上能映射，比如nvim-qt，终端模拟器需要自己修改映射)
map('i', '<S-CR>', '<End><CR>')
-- jk从终端退出
map('t', "==", "<C-\\><C-n>")
-- 移动行代码
map('n', "<A-j>", ":m .+1<CR>==")
map('n', "<A-k>", ":m .-2<CR>==")

