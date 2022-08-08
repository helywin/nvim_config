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

        -- use {
        --     after = "onedarkpro.nvim",
        --     "kyazdani42/nvim-web-devicons",
        --     config = function()
        --         require("conf.icons")
        --     end
        -- }

        use {
            "helywin/base46",
            branch = "self",
            config = function()
                local ok, base46 = pcall(require, "base46")

                if ok then
                    vim.g.nvchad_theme = "onedark"
                    base46.load_theme()
                end
            end
        }

        -- 中文文档
        -- use {
        --     "yianwillis/vimcdoc"
        -- }

        -- 树结构插件
        use {
            "kyazdani42/nvim-tree.lua",
            requires = {
                "kyazdani42/nvim-web-devicons"
            },
            config = function()
                require("conf.nvim-tree")
            end,
            tag = "nightly"
        }

        -- one dark主题
        -- use {
            -- "navarasu/onedark.nvim",
        --     "olimorris/onedarkpro.nvim",
        --     config = function()
        --         require("conf.onedarkpro")
        --     end
        -- }

        -- tokyo night 主题
        -- use {
        --     "folke/tokyonight.nvim",
        --     config = function()
        --         require("conf.tokyonight")
        --     end
        -- }

        use {
            "nvim-lualine/lualine.nvim",
            config = function ()
                require("conf.lualine")
            end
        }
        -- feline状态栏插件
        -- use {
        --     "feline-nvim/feline.nvim",
        --     config = function()
        --         require("conf.feline")
        --     end
        -- }

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
                "famiu/bufdelete.nvim",
                "kyazdani42/nvim-web-devicons"
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

        -- 搜索时显示条目
        use {
            "kevinhwang91/nvim-hlslens",
            config = function()
                require("conf.nvim-hlslens")
            end
        }

        -- indent-blankline，对齐竖线
        use {
            "lukas-reineke/indent-blankline.nvim",
            config = function()
                require("conf.indent-blankline")
            end
        }

        -- 自动匹配括号
        use {
            "windwp/nvim-autopairs",
            config = function()
                require("conf.nvim-autopairs")
            end
        }

        -- 自动保存
        use {
            "Pocco81/AutoSave.nvim",
            config = function()
                require("conf.AutoSave")
            end
        }

        -- 自动恢复光标位置
        use {
            "ethanholz/nvim-lastplace",
            config = function()
                require("conf.nvim-lastplace")
            end
        }

        -- 自动会话管理
        -- use {
        --     "rmagatti/auto-session",
        --     config = function()
        --         require("conf.auto-session")
        --     end
        -- }

        -- 显示滚动条
        use {
            "petertriho/nvim-scrollbar",
            config = function()
                require("conf.nvim-scrollbar")
            end
        }

        -- 显示网页色
        use {
            "norcalli/nvim-colorizer.lua",
            config = function()
                require("conf.nvim-colorizer")
            end
        }

        -- 内置终端
        use {
            "akinsho/toggleterm.nvim",
            config = function()
                require("conf.toggleterm")
            end
        }

        -- 模糊查找
        use {
            "nvim-telescope/telescope.nvim",
            requires = {
                "nvim-lua/plenary.nvim", -- Lua 开发模块
                "BurntSushi/ripgrep", -- 文字查找
                "sharkdp/fd", -- 文件查找
                "kdheepak/lazygit.nvim" -- lazygit
            },
            config = function()
                require("conf.telescope")
            end
        }

        -- 精美弹窗
        use {
            "rcarriga/nvim-notify",
            config = function()
                require("conf.nvim-notify")
            end
        }

        -- todo tree
        use {
            "folke/todo-comments.nvim",
            config = function()
                require("conf.todo-comments")
            end
        }

        -- LSP基础服务
        use {
            "neovim/nvim-lspconfig",
            config = function()
                require("conf.nvim-lspconfig")
            end
        }

        -- LSP UI 美化
        use {
            "tami5/lspsaga.nvim",
            config = function()
                require("conf.lspsaga")
            end
        }

        -- 自动安装 LSP
        use {
            "williamboman/nvim-lsp-installer",
            config = function()
                require("conf.nvim-lsp-installer")
            end
        }

        -- lua dev
        use {
            "folke/lua-dev.nvim",
            config = function()
                require("conf.lua-dev")
            end
        }

        -- null-ls
        -- use {
        --     "jose-elias-alvarez/null-ls.nvim",
        --     config = function ()
        --         require("conf.null-ls")
        --     end
        -- }

        -- LSP 进度提示
        -- use {
        --     "j-hui/fidget.nvim",
        --     config = function()
        --         require("conf.fidget")
        --     end
        -- }

        -- 插入模式获得函数签名
        use {
            "ray-x/lsp_signature.nvim",
            config = function()
                require("conf.lsp_signature")
            end
        }

        -- 灯泡提示代码行为
        use {
            "kosayoda/nvim-lightbulb",
            config = function()
                require("conf.nvim-lightbulb")
            end
        }

        use {
            "L3MON4D3/LuaSnip",
            config = function()
                require("conf.luasnip")
            end
        }

        -- 自动代码补全系列插件
        use {
            "hrsh7th/nvim-cmp", -- 代码补全核心插件，下面都是增强补全的体验插件
            requires = {
                { "onsails/lspkind-nvim" }, -- 为补全添加类似 vscode 的图标
                -- { "hrsh7th/vim-vsnip" },
                -- { "hrsh7th/vim-vsnip-integ" },
                -- { "hrsh7th/cmp-vsnip" }, -- 适用于 vsnip 的代码片段源
                { "L3MON4D3/LuaSnip" },
                { "saadparwaiz1/cmp_luasnip" },
                { "hrsh7th/cmp-nvim-lsp" }, -- 替换内置 omnifunc，获得更多补全
                { "hrsh7th/cmp-path" }, -- 路径补全
                { "hrsh7th/cmp-buffer" }, -- 缓冲区补全
                { "hrsh7th/cmp-cmdline" }, -- 命令补全
                { "f3fora/cmp-spell" }, -- 拼写建议
                { "rafamadriz/friendly-snippets" }, -- 提供多种语言的代码片段
                { "lukas-reineke/cmp-under-comparator" }, -- 让补全结果的排序更加智能
            },
            config = function()
                require("conf.nvim-cmp")
            end
        }

        -- 语法高亮
        use {
            "nvim-treesitter/nvim-treesitter",
            run = { ":TSupdate" },
            requires = {
                "p00f/nvim-ts-rainbow" -- 彩虹括号
            },
            config = function()
                require("conf.nvim-treesitter")
            end
        }

        -- 代码注释
        use {
            "numToStr/Comment.nvim",
            requires = {
                "JoosepAlviste/nvim-ts-context-commentstring"
            },
            config = function()
                require("conf.Comment")
            end
        }

        -- 代码大纲
        use {
            "simrat39/symbols-outline.nvim",
            config = function()
                require("conf.symbols-outline")
            end
        }

        -- 代码调试基础插件
        use {
            "mfussenegger/nvim-dap",
            config = function()
                require("conf.nvim-dap")
            end
        }

        -- 为代码调试提供内联文本
        use {
            "theHamsta/nvim-dap-virtual-text",
            requires = {
                "mfussenegger/nvim-dap"
            },
            config = function()
                require("conf.nvim-dap-virtual-text")
            end
        }

        -- 为代码调试提供 UI 界面
        use {
            "rcarriga/nvim-dap-ui",
            requires = {
                "mfussenegger/nvim-dap"
            },
            config = function()
                require("conf.nvim-dap-ui")
            end
        }


        -- 启动页面插件
        use {
            'goolord/alpha-nvim',
            requires = {
                'kyazdani42/nvim-web-devicons'
            },
            config = function()
                require("conf.alpha-nvim")
            end
        }

        -- lazygit插件
        use {
            "kdheepak/lazygit.nvim", -- lazygit
            requires = {
                "nvim-lua/plenary.nvim",
            },
            config = function()
                require("conf.lazygit")
            end,
        }

        -- orgmode
        --[[
            use {
                "nvim-neorg/neorg",
                -- tag = "latest",
                ft = {"norg"},
                after = "nvim-treesitter", -- You may want to specify Telescope here as well
                config = function()
                    require('conf.neorg')
                end
            }
            ]] --

        -- 高亮当前行
        use {
            "yamatsum/nvim-cursorline",
            config = function()
                require("conf.nvim-cursorline")
            end
        }

        -- 多光标模式
        use {
            "mg979/vim-visual-multi",
            config = function()
                require("conf.vim-visual-multi")
            end
        }

        -- 最大字符数竖线
        use {
            "lukas-reineke/virt-column.nvim",
            config = function()
                require("conf.virt-column")
            end,
            ft = { "cpp" }
        }

        --CMake插件
        use {
            "Shatur/neovim-cmake",
            config = function()
                require("conf.neovim-cmake")
            end
        }

        -- 弹窗输入插件
        use {
            'stevearc/dressing.nvim',
            config = function()
                require("conf.dressing")
            end
        }

        -- better escape
        use {
            'jdhao/better-escape.vim',
            config = function()
                require("conf.better-escape")
            end
        }

        -- doxygen 插件
        use {
            "vim-scripts/DoxygenToolkit.vim"
        }

        -- which key插件
        use {
            "folke/which-key.nvim",
            config = function()
                require("conf.which-key")
            end
        }

        use {
            "sindrets/diffview.nvim",
            requires = {'nvim-lua/plenary.nvim'},
            config = function ()
                require("conf.diffview")
            end
        }
        
        -- leetcode插件
        use {
            "mbledkowski/neuleetcode.vim",
            config = function ()
                vim.g.leetcode_china = 1
                vim.g.leetcode_solution_filetype = 'cpp'
                vim.g.leetcode_browser = 'chrome'
                vim.g.leetcode_hide_paid_only = 1
            end
        }

        use {
            "aperezdc/vim-template",
            config = function ()
                local utils = require("core.utils")
                vim.g.templates_directory = utils.join_paths(vim.fn.stdpath("config"), "template")
                -- NOTE:replace with your own email address if not correct
                vim.g.user = utils.get_git_user()
                vim.g.email = utils.get_git_email()
            end
        }

        -- gitmoji 插件
        use {
            "bruxisma/gitmoji.vim"
        }

        -- use {
        --     "RRethy/vim-illuminate",
        --     config = function ()
        --       require("conf.vim-illuminate")
        --     end
        -- }

        use {
            "luukvbaal/nnn.nvim",
            config = function()
                require("nnn").setup()
            end
        }

        -- use {
        --     "phaazon/hop.nvim",
        --     branch = "v2",
        --     config = function ()
        --         require("conf.hop");
        --     end
        -- }

        use {
            "ggandor/lightspeed.nvim",
            config = function ()
                require("conf.lightspeed")
            end
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
-- vim.cmd(
-- [[
--     augroup packer_user_config
--         autocmd!
--         autocmd BufWritePost plugins.lua source <afile> | PackerCompile
--     augroup end
-- ]]
-- )

-- vim.cmd("colorscheme onedark")
