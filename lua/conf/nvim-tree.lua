-- https://github.com/kyazdani42/nvim-tree.lua

local present, nvimtree = pcall(require, "nvim-tree")

if not present then
    return
end

local options =
{
    -- 视图
    view = {
        -- 宽度
        width = 30,
        -- 高度
        height = 30,
        -- 隐藏顶部的根目录显示
        hide_root_folder = false,
        -- 自动调整大小
        auto_resize = true,
        -- 按键绑定
        mappings = {
            custom_only = false,
            list = {
                { key = { "l", "<CR>", "o" }, action = "edit", mode = "n" },
                { key = "h", action = "close_node" },
                { key = "v", action = "vsplit" },
                { key = "q", action = "close" },
                { key = "C", action = "cd" },
            },
        },
        signcolumn = "yes",
    },
    diagnostics = {
        -- 是否启用文件诊断信息
        enable = false,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = ""
        }
    },
    git = {
        -- 是否启用 git 信息
        enable = true,
        ignore = false,
        timeout = 200
    },
    disable_netrw = true,
    hijack_netrw = true,
    ignore_ft_on_setup = { "dashboard" },
    open_on_tab = false,
    hijack_cursor = true,
    hijack_unnamed_buffer_when_opening = false,
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = false,
    },
}

-- 禁用一些图标，不然文字放不下了
vim.g.nvim_tree_show_icons = {
    git = 0,
    folders = 1,
    files = 1,
    folder_arrows = 1,
    symlink = 1
}

-- 根目录只显示一个文件夹名称，不然放不下
vim.g.nvim_tree_root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" }


-- 默认图标，可自行修改
vim.g.nvim_tree_icons = {
    -- default = "",
    -- symlink = " ",
    symlink = "",
    git = {
        unstaged = "",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = "*",
        deleted = "",
        ignored = ""
    },
    folder = {
        default = "",
        empty = "",
        empty_open = "",
        open = "",
        symlink = "",
        symlink_open = "",
        arrow_open = "",
        arrow_closed = "",
     }
}

-- 目录后加上反斜杠 /
vim.g.nvim_tree_add_trailing = 1
-- 颜色
vim.g.nvim_tree_git_hl = 1
-- 图标外边间隔
vim.g.nvim_tree_icon_padding = ' '


nvimtree.setup(options)

-- 默认按键
-- o     ：打开目录或文件
-- a     ：新增目录或文件
-- r     ：重命名目录或文件
-- x     ：剪切目录或文件
-- c     ：复制目录或文件
-- d     ：删除目录或文件
-- y     ：复制目录或文件名称
-- Y     ：复制目录或文件相对路径
-- gy    ：复制目录或文件绝对路径
-- p     ：粘贴目录或文件
-- s     ：使用系统默认程序打开目录或文件
-- <Tab> ：将文件添加到缓冲区，但不移动光标
-- <C-v> ：垂直分屏打开文件
-- <C-x> ：水平分屏打开文件
-- <C-]> ：进入光标下的目录
-- <C-r> ：重命名目录或文件，删除已有目录名称
-- -     ：返回上层目录
-- I     ：切换隐藏文件/目录的可见性
-- H     ：切换点文件的可见性
-- R     ：刷新资源管理器
-- 另外，文件资源管理器操作和操作文档方式一致，可按 / ? 进行搜索
