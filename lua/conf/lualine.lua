local present, lualine = pcall(require, "lualine")

if not present then
    return
end

local options = {
    theme = 'tokyonight'
}

lualine.setup(options)

