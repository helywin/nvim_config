local present, which_key = pcall(require, "which-key")

if not present then
    return
end

local options = {
}

which_key.register({
  f = {
    name = "file", -- optional group name
    f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
    -- ["1"] = "which_key_ignore",  -- special label to hide it in the popup
    -- b = { function() print("bar") end, "Foobar" } -- you can also pass functions!
  },
  ["/"] = "Comment",
  ["1"] = "Explorer",  -- special label to hide it in the popup
}, { prefix = "<leader>" })

which_key.setup(options)
