local utils = require("core.utils")
local map = utils.map
local cmd = vim.cmd;
local user_cmd = vim.api.nvim_create_user_command

-- v模式粘贴后不会替换剪贴板内容了
map("v", "p", "p:let @+=@0<CR>")
-- map({ "n", "x", "o" }, "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
-- map({ "n", "x", "o" }, "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
-- map("", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
-- map("", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })

-- ESC消除高亮
map("n", "<ESC>", "<cmd>noh<CR>")
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
map("n", "<C-k>", "<cmd>bprev<CR>")
map("n", "<C-j>", "<cmd>bnext<CR>")
-- normal模式下空格选中单个词语
-- map("n", "<Space>", "viw")
-- shift tab绑定按键+
map('i', '<S-Tab>', '<C-d>')
-- map('n', '<S-Tab>', '<<')

-- ["<TAB>"] = { "<cmd> Tbufnext <CR>", "  goto next buffer" },
-- ["<S-Tab>"] = { "<cmd> Tbufprev <CR> ", "  goto prev buffer" },
map('n', '<Tab>', '<cmd>bnext<CR>')
map('n', '<S-Tab>', '<cmd>bprev<CR>')

-- WARN:重映射<Tab>会使得<C-i>跳转功能失效!
-- map('n', '<Tab>', '>>')
-- shift enter绑定 (仅在带GUI的终端上能映射，比如nvim-qt，终端模拟器需要自己修改映射)
map('i', '<S-CR>', '<End><CR>')
-- jk从终端退出
map('t', "==", "<C-\\><C-n>")
-- 移动行代码
map('n', "<A-j>", ":m .+1<CR>==")
map('n', "<A-k>", ":m .-2<CR>==")
-- 回到当前buffer上一次修改位置
map('n', "gp", "`.")

-- map('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>')
-- map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
-- map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
-- map('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>')

-- Comment
map("n", "<Leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>")
map("v", "<Leader>/", "<esc><cmd>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>")

-- LazyGit
map('n', "<Leader>lg", "<cmd>LazyGit<CR>")

-- hlslens
map("n", "n", "<Cmd>execute('normal!'.v:count1.'n')<CR><Cmd>lua require('hlslens').start()<CR>")
map("n", "N", "<Cmd>execute('normal!'.v:count1.'N')<CR><Cmd>lua require('hlslens').start()<CR>")
map("n", "*", "*<Cmd>lua require('hlslens').start()<CR>")
map("n", "#", "#<Cmd>lua require('hlslens').start()<CR>")
map("n", "g*", "g*<Cmd>lua require('hlslens').start()<CR>")
map("n", "g#", "g#<Cmd>lua require('hlslens').start()<CR>")


-- 按 leader e 打开文件树
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")
-- 按 leader fc 在文件树中找到当前以打开文件的位置
map("n", "<leader>fc", "<cmd>NvimTreeFindFile<CR>")

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
map("n", "<leader>fg", "<cmd>Telescope git_files<CR>")
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>")
map("n", "<leader>fl", "<cmd>Telescope live_grep<CR>")
--[[
vim.keybinds.gmap("n", "<leader>ff", "<cmd>Telescope find_files theme=dropdown<CR>", vim.keybinds.opts)
-- 查找文字
-- 查找特殊符号
vim.keybinds.gmap("n", "<leader>fb", "<cmd>Telescope buffers theme=dropdown<CR>", vim.keybinds.opts)
-- 查找帮助文档
vim.keybinds.gmap("n", "<leader>fh", "<cmd>Telescope help_tags theme=dropdown<CR>", vim.keybinds.opts)
-- 查找最近打开的文件
-- 查找 marks 标记
vim.keybinds.gmap("n", "<leader>fm", "<cmd>Telescope marks theme=dropdown<CR>", vim.keybinds.opts)
]] --

map('n', '<A-n>', '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>')
map('n', '<A-p>', '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>')

-- hop
map('n', '<leader>hw', '<cmd>HopWord<cr>');
