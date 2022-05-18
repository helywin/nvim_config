local present, cursorline = pcall(require, "nvim-cursorline")

if not present then
    return
end

local options =
{
    cursorline = {
        enable = true,
        timeout = 1000,
        number = false,
    },
    cursorword = {
        enable = false,
        min_length = 3,
        hl = { underline = true },
    }
}

cursorline.setup(options)
