-- 自动切换输入法（Fcitx框架）

vim.g.FcitxToggleInput = function()
    -- Linux下面i模式切换到n模式关闭输入法
    if jit.os == "Linux" then
        local input_status = tonumber(vim.fn.system("fcitx-remote"))
        if input_status == 2 then
            vim.fn.system("fcitx-remote -c")
        end
    end
end

-- 退出插入模式时禁用小企鹅输入法
vim.cmd("autocmd InsertLeave * silent! call FcitxToggleInput()")
-- 启动vim时关闭小企鹅输入法，不然每次都要切换一下
vim.cmd("autocmd VimEnter * silent! call FcitxToggleInput()")
vim.g.vsnip_snippet_dir = "~/.config/nvim/snippet"
function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, {...})
    print(unpack(objects))
end

vim.filetype.add({
    pattern = {
        ["*.launch"] = "launch"
    }
})

if jit.os == "Linux" then
    vim.g.python3_host_prog = os.getenv("HOME")..'/anaconda3/bin/python3'
end


