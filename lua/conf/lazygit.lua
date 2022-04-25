require("telescope").load_extension("lazygit")
vim.api.nvim_set_keymap('n', "<Leader>gg", "<cmd>LazyGit<CR>", {noremap = true, silent = true})

