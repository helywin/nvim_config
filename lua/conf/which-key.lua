local present, which_key = pcall(require, "which-key")

if not present then
    return
end

local options = {
}

which_key.register({
    ["ff"] = "Find File",
    ["fg"] = "Git File",
    ["fl"] = "Live Grep",
    ["fo"] = "Old File",
    ["fb"] = "Search In File",
    ["/"] = "Comment",
    ["e"] = "Explorer",
    ["fc"] = "Explorer Find File",

    -- lsp
    ["wa"] = "Add Workspace Folder",
    ["wr"] = "Remove Workspace Folder",
    ["wl"] = "List Workspace Folder",
    ["D"] = "Type Definition",
    ["rn"] = "Rename",
    ["ca"] = "Code Action",
    ["gr"] = "References",
    ["f"] = "Formatting",
}, { prefix = "<leader>", mode = "n" })

which_key.register({
    ["/"] = "Comment",
}, { prefix = "<leader>", mode = "v" })

which_key.register({
    ["gD"] = "Declaration",
    ["gd"] = "Definition",
    ["K"] = "Hover",
    ["gi"] = "Implementation",
}, { prefix = "", mode = "n" })

which_key.setup(options)
