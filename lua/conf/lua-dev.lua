local present, luadev = pcall(require, "lua-dev")

if not present then
    return
end

luadev.setup()

local lspconfig = require('lspconfig')
lspconfig.sumneko_lua.setup(luadev)
