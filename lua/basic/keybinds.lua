vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true })
-- 快速窗口切换
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<C-j>', 'bnext<CR>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<C-k>', 'bprev<CR>', { noremap = true })
-- normal模式下空格选中单个词语
vim.api.nvim_set_keymap('n', '<Space>', 'viw', { noremap = true })
-- 插入模式下的光标移动
vim.api.nvim_set_keymap('i', '<C-h>', '<left>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-l>', '<right>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-j>', '<down>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-k>', '<up>', { noremap = true })
