local present, lualine = pcall(require, "lualine")

if not present then
    return
end

local options = {
    extensions = {
        "nvim-tree",
    }
}

lualine.setup(options)

