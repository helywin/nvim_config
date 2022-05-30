-- https://github.com/akinsho/bufferline.nvim

local present, bufferline = pcall(require, "bufferline")
if not present then
    return
end
local colors = require("base46").get_colors("base_30")

local close_command = function(bufnum)
   require('bufdelete').bufdelete(bufnum, true)
end

local options = {
    options = {
        -- close_command = "bdelete! %d",
        close_command = close_command,
        offsets = {
            {
                filetype = "NvimTree",
                text = "",
                highlight = "Directory",
                padding = 1,
                text_align = "left"
            }
        },
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        show_close_icon = true,
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 14,
        max_prefix_length = 13,
        tab_size = 20,
        show_tab_indicators = true,
        enforce_regular_tabs = false,
        view = "multiwindow",
        show_buffer_close_icons = true,
        separator_style = "thin",
        always_show_buffline = true,
        diagnostics = false,
        custom_filter = function(buf_number)
            local present_type, type = pcall(function()
                return vim.api.nvim_buf_get_var(buf_number, "term_type")
            end)

            if present_type then
                if type == "vert" then
                    return false
                elseif type == "hori" then
                    return false
                end
                return true
            end
            return true
        end,
        highlights = {
            background = {
                guifg = colors.grey_fg,
                guibg = colors.black2,
            },

            -- buffers
            buffer_selected = {
                guifg = colors.white,
                guibg = colors.black,
                gui = "bold",
            },
            buffer_visible = {
                guifg = colors.light_grey,
                guibg = colors.black2,
            },

            -- for diagnostics = "nvim_lsp"
            error = {
                guifg = colors.light_grey,
                guibg = colors.black2,
            },
            error_diagnostic = {
                guifg = colors.light_grey,
                guibg = colors.black2,
            },

            -- close buttons
            close_button = {
                guifg = colors.light_grey,
                guibg = colors.black2,
            },
            close_button_visible = {
                guifg = colors.light_grey,
                guibg = colors.black2,
            },
            close_button_selected = {
                guifg = colors.red,
                guibg = colors.black,
            },
            fill = {
                guifg = colors.grey_fg,
                guibg = colors.black2,
            },
            indicator_selected = {
                guifg = colors.black,
                guibg = colors.black,
            },

            -- modified
            modified = {
                guifg = colors.red,
                guibg = colors.black2,
            },
            modified_visible = {
                guifg = colors.red,
                guibg = colors.black2,
            },
            modified_selected = {
                guifg = colors.green,
                guibg = colors.black,
            },

            -- separators
            separator = {
                guifg = colors.black2,
                guibg = colors.black2,
            },
            separator_visible = {
                guifg = colors.black2,
                guibg = colors.black2,
            },
            separator_selected = {
                guifg = colors.black2,
                guibg = colors.black2,
            },

            -- tabs
            tab = {
                guifg = colors.light_grey,
                guibg = colors.one_bg3,
            },
            tab_selected = {
                guifg = colors.black2,
                guibg = colors.nord_blue,
            },
            tab_close = {
                guifg = colors.red,
                guibg = colors.black,
            },
        },
    }
}

bufferline.setup(options)


-- 关闭当前 buffer，由 bufdelete 插件所提供的方法
--vim.keybinds.gmap("n", "<C-q>", "<cmd>Bdelete!<CR>", vim.keybinds.opts)
-- 切换上一个缓冲区
--vim.keybinds.gmap("n", "<C-h>", "<cmd>BufferLineCyclePrev<CR>", vim.keybinds.opts)
-- 切换下一个缓冲区
--vim.keybinds.gmap("n", "<C-l>", "<cmd>BufferLineCycleNext<CR>", vim.keybinds.opts)
-- 关闭左侧缓冲区
--vim.keybinds.gmap("n", "<leader>bh", "<cmd>BufferLineCloseLeft<CR>", vim.keybinds.opts)
-- 关闭右侧缓冲区
--vim.keybinds.gmap("n", "<leader>bl", "<cmd>BufferLineCloseRight<CR>", vim.keybinds.opts)
