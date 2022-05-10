-- 自动切换输入法（Fcitx框架）

vim.g.FcitxToggleInput = function()
    local lsc = require "luarocks.site_config"
    local system = lsc.LUAROCKS_UNAME_S or io.popen("uname -s"):read("*l")
    if system == "Linux" then
        local input_status = tonumber(vim.fn.system("fcitx-remote"))
        if input_status == 2 then
            vim.fn.system("fcitx-remote -c")
        end
    elseif system == "Windows" then
    end
end

-- 退出插入模式时禁用小企鹅输入法
vim.cmd("autocmd InsertLeave * call FcitxToggleInput()")
-- 启动vim时关闭小企鹅输入法，不然每次都要切换一下
vim.cmd("autocmd VimEnter * call FcitxToggleInput()")
vim.g.vsnip_snippet_dir = "~/.config/nvim/snippet"
vim.cmd[[colorscheme onedarkpro]]
function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, {...})
    print(unpack(objects))
end
