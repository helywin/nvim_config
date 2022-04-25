vim.g["dashboard_default_executive"] = 'telescope'
vim.api.nvim_set_keymap('n', "<Leader>ss", "<cmd>SessionSave<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', "<Leader>sl", "<cmd>SessionLoad<CR>",{noremap = true})
