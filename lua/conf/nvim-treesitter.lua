-- https://github.com/nvim-treesitter/nvim-treesitter
-- https://github.com/p00f/nvim-ts-rainbow

local present, treesitter = pcall(require, "nvim-treesitter")

if not present then
    return
end

local present, base46 = pcall(require, "base46")

local base30 = base46.get_colors("base30")


require("nvim-treesitter.configs").setup(
    {
        -- 安装的高亮支持来源
        -- ensure_installed = "maintained",
        -- 同步下载高亮支持
        sync_install = false,
        -- 高亮相关
        matchup = {
            enable = false;
        },
        autotag = { enable = false },
        highlight = {
            -- 启用高亮支持
            enable = true,
            -- 使用 treesitter 高亮而不是 neovim 内置的高亮
            additional_vim_regex_highlighting = true,
            disable = { "latex" },
        },
        -- 范围选择
        incremental_selection = {
            enable = true,
            keymaps = {
                -- 初始化选择
                init_selection = "<CR>",
                -- 递增
                node_incremental = "<CR>",
                -- 递减
                node_decremental = "<BS>",
                -- 选择一个范围
                scope_incremental = "<TAB>"
            }
        },
        -- 缩进，关闭
        indent = {
            enable = false,
            disable = { "yaml" },
        },
        -- 彩虹括号，由 nvim-ts-rainbow 插件提供
        rainbow = {
            enable = true,
            extended_mode = true,
            -- colors = {
            --     rainbowcol1 = { fg = theme.colors.red },
            --     rainbowcol2 = { fg = theme.colors.yellow },
            --     rainbowcol3 = { fg = theme.colors.orange },
            --     rainbowcol4 = { fg = theme.colors.green },
            --     rainbowcol5 = { fg = theme.colors.blue },
            --     rainbowcol6 = { fg = theme.colors.cyan },
            --     rainbowcol7 = { fg = theme.colors.purple },
            -- }, -- table of hex strings
            -- termcolors = {} -- table of colour name strings
        },

        -- 根据当前上下文定义文件类型，由 nvim-ts-context-commentstring 插件提供
        context_commentstring = {
            enable = true,
            config = {
                typescript = "// %s",
                css = "/* %s */",
                scss = "/* %s */",
                html = "<!-- %s -->",
                svelte = "<!-- %s -->",
                vue = "<!-- %s -->",
                json = "",
            }
        }
    }
)
