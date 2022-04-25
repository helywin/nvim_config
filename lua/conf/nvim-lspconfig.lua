-- https://github.com/neovim/nvim-lspconfig
-- 更多样式定制，参见：https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization

local opts = { noremap = true, silent = true }
-- 诊断样式定制
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer


vim.diagnostic.config({
   -- 诊断的虚拟文本
   virtual_text = {
       -- 显示的前缀，可选项：'●', '▎', 'x'
       -- 默认是一个小方块，不是很好看，所以这里改了
       prefix = "●",
       -- 是否总是显示前缀？是的
       source = "always"
   },
   float = {
       -- 是否显示诊断来源？是的
       source = "always"
   },
   -- 在插入模式下是否显示诊断？不要
   update_in_insert = false
})
