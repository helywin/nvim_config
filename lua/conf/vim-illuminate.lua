local lspconfig = require("lspconfig")

lspconfig.clangd.setup {
    on_attach = function(client)
        -- [[ other on_attach code ]]
        require('illuminate').on_attach(client)
    end,
}

lspconfig.sumneko_lua.setup {
    on_attach = function(client)
        -- [[ other on_attach code ]]
        require('illuminate').on_attach(client)
    end,
}

vim.cmd("hi def link LspReferenceText CursorLine")
vim.cmd("hi def link LspReferenceWrite CursorLine")
vim.cmd("hi def link LspReferenceRead CursorLine")
-- vim.cmd("hi link illuminatedWord Visual")
