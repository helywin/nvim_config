-- https://github.com/kosayoda/nvim-lightbulb

local present, lightbulb = pcall(require, "nvim-lightbulb")

if not present then
    return
end

vim.cmd([[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]])
