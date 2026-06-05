-- Set colors from nvim to match terminal's. Disable if you dont like
vim.o.termguicolors = true
-- Set tab size
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
-- Add numbers
vim.o.number = true
-- Relative line numbers, disable by default
-- vim.o.relativenumber = true
-- Quality of life for case sensitive commands with ":"
vim.o.ignorecase = true
vim.o.smartcase = true
vim.opt.completeopt = { "menuone", "noselect", "popup" }

-- Package manager setup with vim.pack
vim.pack.add({
        'https://github.com/mason-org/mason.nvim',
        'https://github.com/mason-org/mason-lspconfig.nvim',
        'https://github.com/neovim/nvim-lspconfig',
        'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
})

-- Mason setup
require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
	    ensure_installed = {
		-- from here can be considered bloat, if you want to add more you can use ":Mason" or add here, ill add example for lua for config
		-- convenience
        "lua_ls",
    },
})

-- Lua Setup (for Neovim config)
vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim", "require" } },
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
            telemetry = { enable = false },
        },
    },
})

-- Completion
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client ~= nil and client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end
    end,
})
