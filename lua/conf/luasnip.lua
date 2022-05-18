local present, luasnip = pcall(require, "luasnip")
local utils = require("core.utils")

if not present then
    return
end


luasnip.config.set_config {
    history = true,
    updateevents = "TextChanged,TextChangedI",
}



local paths = {
    utils.join_paths(vim.fn.stdpath("data"), "site", "pack", "packer", "start", "friendly-snippets"),
}

local user_snippets = utils.join_paths(vim.fn.stdpath("config"), "snippet")
if utils.is_directory(user_snippets) then
    paths[#paths + 1] = user_snippets
end


-- add snippet path here!
require("luasnip.loaders.from_lua").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load({ paths = paths })
require("luasnip.loaders.from_snipmate").lazy_load()
