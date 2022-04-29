-- 自动切换输入法（Fcitx框架）

vim.g.FcitxToggleInput = function()
    local input_status = tonumber(vim.fn.system("fcitx-remote"))
    if input_status == 2 then
        vim.fn.system("fcitx-remote -c")
    end
end

-- 退出插入模式时禁用小企鹅输入法
vim.cmd("autocmd InsertLeave * call FcitxToggleInput()")
-- 启动vim时关闭小企鹅输入法，不然每次都要切换一下
vim.cmd("autocmd VimEnter * call FcitxToggleInput()")
vim.g.vsnip_snippet_dir = "~/.config/nvim/snippet"
vim.cmd[[colorscheme onedarkpro]]
