local lspconfig = require("lspconfig")

lspconfig.clangd.setup {
    on_attach = function(client)
        -- [[ other on_attach code ]]
        require 'illuminate'.on_attach(client)
    end,
}
