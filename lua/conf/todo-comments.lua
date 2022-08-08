-- https://github.com/folke/todo-comments.nvim

local present, todo_comments = pcall(require, "todo-comments")

if not present then
    return
end
local options =
{
    keywords = {
        -- alt ： 别名
        FIX = {
            icon = " ",
            color = "#DC2626",
            alt = { "FIXME", "BUG", "FIXIT", "ISSUE", "!" }
        },
        TODO = { icon = " ", color = "#7eca9c" },
        HACK = { icon = " ", color = "#c882e7" },
        WARN = { icon = " ", color = "#e7c787", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", color = "#fca2aa", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "#61afef", alt = { "INFO" } }
    }
}

todo_comments.setup(options)

-- 查找 TODO 标签
--[[
vim.keybinds.gmap("n", "<leader>ft", "<cmd>TodoTelescope theme=dropdown<CR>", vim.keybinds.opts)
]]
