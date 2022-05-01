-- https://github.com/lukas-reineke/indent-blankline.nvim

local present, blankline = pcall(require, "indent_blankline")

if not present then
    return
end

local options = {
    -- 显示当前所在区域
    show_current_context = true,
    -- 显示当前所在区域的开始位置
    show_current_context_start = true,
    -- 显示行尾符
    show_end_of_line = true,
    indentLine_enabled = 1,
    char = "▏",
    filetype_exclude = {
        "help",
        "terminal",
        "alpha",
        "packer",
        "lspinfo",
        "TelescopePrompt",
        "TelescopeResults",
        "nvchad_cheatsheet",
        "lsp-installer",
        "",
    },
    buftype_exclude = { "terminal" },
    show_trailing_blankline_indent = false,
    show_first_indent_level = false,
}

blankline.setup(options)
