-- https://github.com/ethanholz/nvim-lastplace

local present, lastplace = pcall(require, "lastplace")

if not present then
    return
end

local options =
{
    -- 那些 buffer 类型不记录光标位置
    lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
    -- 那些文件类型不记录光标位置
    lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
    lastplace_open_folds = true
}

lastplace.setup(options)
