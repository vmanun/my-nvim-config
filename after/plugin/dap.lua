local dap = require("dap")

vim.keymap.set("n", '<leader>dk', function() dap.continue() end)
vim.keymap.set("n", '<leader>dl', function() dap.run_last() end)
vim.keymap.set("n", '<leader>db', function() dap.toggle_breakpoint() end)

dap.adapters.firefox = {
    type = 'executable',
    command = 'node',
    args = { os.getenv('HOME') .. '/.config/dap/vscode-firefox-debug/dist/adapter.bundle.js' },
}

dap.adapters.chrome = {
    type = "executable",
    command = "node",
    args = { os.getenv("HOME") .. "/.config/dap/vscode-chrome-debug/out/src/chromeDebug.js" } -- TODO adjust
}

dap.adapters["pwa-node"] = {
    type = "server",
    host = "localhost",
    port = "${port}",
    executable = {
        command = "node",
        args = { os.getenv("HOME") .. ".config/dap/vscode-js-debug/js-debug/src/dapDebugServer.js", "${port}" },
    }
}

dap.configurations.javascript = {
    type = "node",
    request = "launch",
    name = "run app",
    program = "${workspacefolder}/src/app.ts",
    prelaunchtask = "npm: build",
    sourcemaps = true,
    internalconsoleoptions = "openonsessionstart",
    outfiles = { "${workspacefolder}/dist/**/*.js" },
    outputcapture = "std",
}


dap.configurations.typescriptreact = {
    {
        name = 'Debug with Firefox',
        type = 'firefox',
        request = 'launch',
        reAttach = true,
        url = 'http://localhost:3000',
        webRoot = '${workspaceFolder}/src',
        firefoxExecutable = '/usr/bin/firefox',
        smartStep = true,
        sourceMapPathOverride = {
            ["webpack:///./*"] = "${webRoot}/*"
        },
    },
    {
        name = 'Debug with Chrome',
        type = 'chrome',
        request = 'launch',
        reAttach = true,
        url = 'http://localhost:3000',
        webRoot = '${workspaceFolder}/src',
        firefoxExecutable = '/usr/bin/firefox',
        smartStep = true,
        sourceMapPathOverride = {
            ["webpack:///./*"] = "${webRoot}/*"
        },
    }
}

dap.configurations.typescript = {
    type = "node",
    request = "launch",
    name = "Run app",
    program = "${workspaceFolder}/src/app.ts",
    preLaunchTask = "npm: build",
    sourceMaps = true,
    internalConsoleOptions = "openOnSessionStart",
    outFiles = { "${workspaceFolder}/dist/**/*.js" },
    outputCapture = "std",
}
