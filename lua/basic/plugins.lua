---@diagnostic disable: undefined-global
-- https://github.com/wbthomason/packer.nvim

local packer = require("packer")
packer.startup(
    {
        -- 所有插件的安装都书写在 function 中
        function()
            -- 包管理器
            use {
                "wbthomason/packer.nvim"
            }

            -- 中文文档
            use {
                "yianwillis/vimcdoc"
            }

            -- 树结构插件
            use {
                "kyazdani42/nvim-tree.lua",
                requires = {
                    "kyazdani42/nvim-web-devicons"
                },
                config = function()
                    require("conf.nvim-tree")
                end
            }

            -- one dark主题
            use {
                "navarasu/onedark.nvim",
                config = function()
                    require("conf.onedark")
                end
            }

            -- windline状态栏插件
            use {
                "windwp/windline.nvim",
                config = function()
                    require("conf.windline")
                end
            }

            -- gitsigns插件
            use {
                "lewis6991/gitsigns.nvim",
                requires = {
                    "nvim-lua/plenary.nvim"
                },
                config = function()
                    require("conf.gitsigns")
                end
            }

            -- bufferline插件
            use {
                "akinsho/bufferline.nvim",
                requires = {
                    "famiu/bufdelete.nvim"
                },
                config = function()
                    require("conf.bufferline")
                end
            }

            -- markdown preview插件
            use {
                "iamcco/markdown-preview.nvim",
                -- 克隆完仓库需要安装npm依赖
                run = "cd app && npm install",
                setup = function()
                    vim.g.mkdp_filetypes = { "markdown" }
                end,
                -- 只针对特定的文件类型能够执行命令
                ft = { "markdown" },
            }

            -- 安装其它插件
        end,
        -- 使用浮动窗口
        config = {
            display = {
                open_fn = require("packer.util").float
            }
        }
    }
)

-- 实时生效配置
vim.cmd(
    [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerCompile
        colorscheme onedark
    augroup end
]]
)
