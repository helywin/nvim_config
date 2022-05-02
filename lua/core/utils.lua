local M = {}
local cmd = vim.cmd

M.map = function(mode, keys, command, opt)
    local options = { noremap = true, silent = true }
    if opt then
        options = vim.tbl_extend("force", options, opt)
    end

    if type(keys) == "table" then
        for _, keymap in ipairs(keys) do
            map(mode, keymap, command, opt)
        end
    end

    vim.keymap.set(mode, keys, command, opt)
end

M.bg = function(group, col)
   cmd("hi " .. group .. " guibg=" .. col)
end

-- Define fg color
-- @param group Group
-- @param color Color
M.fg = function(group, col)
   cmd("hi " .. group .. " guifg=" .. col)
end

-- Define bg and fg color
-- @param group Group
-- @param fgcol Fg Color
-- @param bgcol Bg Color
M.fg_bg = function(group, fgcol, bgcol)
   cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
end


return M
