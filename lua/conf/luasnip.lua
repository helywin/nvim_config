local present, luasnip = pcall(require, "luasnip")

if present then
    return
end

luasnip.config.set_config {
    history = true,
    updateevents = "TextChanged,TextChangedI",
}

-- add snippet path here!
require("luasnip.loaders.from_vscode").load({ paths = {"./snippet"} })
require("luasnip.loaders.from_vscode").lazy_load()
