local present, luadev = pcall(require, "lua-dev")

if not present then
    return
end

local luadev = require("lua-dev").setup({
  -- add any options here, or leave empty to use the default settings
  -- lspconfig = {
  --   cmd = {"lua-language-server"}
  -- },
})

local lspconfig = require('lspconfig')
lspconfig.sumneko_lua.setup(luadev)
