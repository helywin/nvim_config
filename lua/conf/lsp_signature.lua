-- https://github.com/ray-x/lsp_signature.nvim

local present, lsp_signature = pcall(require, "lsp_signature")

if not present then
    return
end

local options = {
    bind = true,
    doc_lines = 0,
    floating_window = false,
    fix_pos = true,
    hint_enable = false,
    hint_prefix = " ",
    hint_scheme = "String",
    --hi_parameter = "Search",
    hi_parameter = "LspSignatureActiveParameter",
    max_height = 22,
    max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
    handler_opts = {
        border = "rounded", -- double, single, shadow, none
    },
    toggle_key = "<C-p>",
    zindex = 200, -- by default it will be on top of all floating windows, set to 50 send it to bottom
    padding = "", -- character to pad on left and right of signature can be ' ', or '|'  etc
}

lsp_signature.setup(options)
