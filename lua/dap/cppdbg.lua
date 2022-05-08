-- https://github.com/mfussenegger/nvim-dap/wiki/C-C---Rust-(gdb-via--vscode-cpptools)
return {
    id = 'cppdbg',
    request = "launch",
    name = "Launch file",
    type = 'executable',
    command = '~/software/extension/debugAdapters/bin/OpenDebugAD7'
}
    -- local dap = require('dap')
    -- dap.configurations.python = {
    --   {
    --     type = 'python';
    --     request = 'launch';
    --     name = "Launch file";
    --     program = "${file}";
    --     pythonPath = function()
    --       return '/usr/bin/python'
    --     end;
    --   },
    -- }
