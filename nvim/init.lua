vim.cmd([[set mouse=]])
vim.cmd([[set noswapfile]])
vim.cmd([[hi @lsp.type.number gui=italic]])
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
vim.o.termguicolors = true
vim.opt.winborder = "single"
vim.o.autochdir = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.showtabline = 2
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.wrap = false

vim.o.number = true
vim.o.mouse = ""
vim.o.showmode = true
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = "yes"

vim.o.updatetime = 250
vim.o.timeoutlen = 2000

vim.o.splitright = true
vim.o.splitbelow = true
vim.o.inccommand = "split"
vim.o.cursorline = false
vim.o.scrolloff = 0
vim.o.confirm = true
-- Keymaps
vim.keymap.set('v', '<leader>ol', '<cmd>ObsidianLink<CR>')
vim.keymap.set('n', '<leader>sl', '<cmd>ObsidianTags<CR>')
vim.keymap.set('v', '<leader>on', '<cmd>ObsidianLink<CR>')
vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<CR>")
vim.keymap.set("n", "<leader>so", "<cmd>ObsidianQuickSwitch<CR>")
--vim.keymap.set("n", "<C-d>", "<C-d>zz")
--vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-p>", ":pu=strftime('%d-%m-%y')<CR>")
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>w", "<cmd>update<CR>")
vim.keymap.set("n", "<leader>o", "<cmd>source<CR>")
vim.keymap.set("n", "<leader>O", "<cmd>restart<CR>")
vim.keymap.set("n", "<leader>e", "<cmd>Oil<CR>")
vim.keymap.set({ "n", "t" }, "<Leader>t", "<Cmd>tabnew<CR>")
vim.keymap.set({ "n", "t" }, "<Leader>x", "<Cmd>tabclose<CR>")
vim.keymap.set({ "v", "x", "n" }, "<C-y>", '"+y', { desc = "System clipboard yank." })
vim.keymap.set({ "v", "x", "n" }, "<C-p>", '"+p', { desc = "System clipboard paste." })
for i = 1, 8 do
	vim.keymap.set({ "n", "t" }, "<Leader>" .. i, "<Cmd>tabnext " .. i .. "<CR>")
end

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
-- AutoCMD
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})
--Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)
require("lazy").setup({
	{
		"NMAC427/guess-indent.nvim",
		auto_cmd = true,
		lazy = false,
		opts = {},
	},
	-- Detect tabstop and shiftwidth automatically
--	{ -- Adds git related signs to the gutter, as well as utilities for managing changes
--		"lewis6991/gitsigns.nvim",
--		opts = {
--			signs = {
--				add = { text = "+" },
--				change = { text = "~" },
--				delete = { text = "_" },
--				topdelete = { text = "‾" },
--				changedelete = { text = "~" },
--			},
--		},
--	},
	--  { -- Useful plugin to show you pending keybinds.
	--    'folke/which-key.nvim',
	--    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
	--    opts = {
	--      delay = 0,
	--      icons = {
	--        mappings = vim.g.have_nerd_font,
	--        keys = vim.g.have_nerd_font and {} or {
	--          Up = '<Up> ',
	--          Down = '<Down> ',
	--          Left = '<Left> ',
	--          Right = '<Right> ',
	--          C = '<C-…> ',
	--          M = '<M-…> ',
	--          D = '<D-…> ',
	--          S = '<S-…> ',
	--          CR = '<CR> ',
	--          Esc = '<Esc> ',
	--          ScrollWheelDown = '<ScrollWheelDown> ',
	--          ScrollWheelUp = '<ScrollWheelUp> ',
	--          NL = '<NL> ',
	--          BS = '<BS> ',
	--          Space = '<Space> ',
	--          Tab = '<Tab> ',
	--          F1 = '<F1>',
	--          F2 = '<F2>',
	--          F3 = '<F3>',
	--          F4 = '<F4>',
	--          F5 = '<F5>',
	--          F6 = '<F6>',
	--          F7 = '<F7>',
	--          F8 = '<F8>',
	--          F9 = '<F9>',
	--          F10 = '<F10>',
	--          F11 = '<F11>',
	--          F12 = '<F12>',
	--        },
	--      },
	--      spec = {
	--        { '<leader>s', group = '[S]earch' },
	--        { '<leader>t', group = '[T]oggle' },
	--        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
	--      },
	--    },
	--  },
	{ -- Fuzzy Finder (files, lsp, etc)
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ -- If encountering errors, see telescope-fzf-native README for installation instructions
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
		config = function()
			require("telescope").setup({
				defaults = {
					preview = { treesitter = false },
					color_devicons = true,
					sorting_strategy = "ascending",
					borderchars = {
						"─", -- top
						"│", -- right
						"─", -- bottom
						"│", -- left
						"┌", -- top-left
						"┐", -- top-right
						"┘", -- bottom-right
						"└", -- bottom-left
					},
					path_displays = { "smart" },
					layout_config = {
						height = 100,
						width = 400,
						prompt_position = "top",
						preview_cutoff = 40,
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			})
			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")
			-- Telescope Keymaps
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
			vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
			vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
			vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
			vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
			vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
			vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
			vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
			vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
			vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
			vim.keymap.set("n", "<leader>/", function()
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 0,
					previewer = false,
				}))
			end, { desc = "[/] Fuzzily search in current buffer" })
			vim.keymap.set("n", "<leader>s/", function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end, { desc = "[S]earch [/] in Open Files" })
			vim.keymap.set("n", "<leader>sn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "[S]earch [N]eovim files" })
		end,
	},
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		-- Main LSP Configuration
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"mason-org/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
			"saghen/blink.cmp",
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end
					map("grn", vim.lsp.buf.rename, "[R]e[n]ame")
					map("gra", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })
					map("grr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
					map("gri", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
					map("grd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
					map("grD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
					map("gO", require("telescope.builtin").lsp_document_symbols, "Open Document Symbols")
					map("gW", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Open Workspace Symbols")
					map("grt", require("telescope.builtin").lsp_type_definitions, "[G]oto [T]ype Definition")
					---@param client vim.lsp.Client
					---@param method vim.lsp.protocol.Method
					---@param bufnr? integer some lsp support methods only in specific files
					---@return boolean
					local function client_supports_method(client, method, bufnr)
						if vim.fn.has("nvim-0.11") == 1 then
							return client:supports_method(method, bufnr)
						else
							return client.supports_method(method, { bufnr = bufnr })
						end
					end
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if
						client
						and client_supports_method(
							client,
							vim.lsp.protocol.Methods.textDocument_documentHighlight,
							event.buf
						)
					then
						local highlight_augroup =
							vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})

						vim.api.nvim_create_autocmd("LspDetach", {
							group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
							end,
						})
					end
					if
						client
						and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf)
					then
						map("<leader>th", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
						end, "[T]oggle Inlay [H]ints")
					end
				end,
			})
			vim.diagnostic.config({
				severity_sort = true,
				float = { border = "rounded", source = "if_many" },
				underline = { severity = vim.diagnostic.severity.ERROR },
				signs = vim.g.have_nerd_font and {
					text = {
						[vim.diagnostic.severity.ERROR] = "󰅚 ",
						[vim.diagnostic.severity.WARN] = "󰀪 ",
						[vim.diagnostic.severity.INFO] = "󰋽 ",
						[vim.diagnostic.severity.HINT] = "󰌶 ",
					},
				} or {},
				virtual_text = {
					source = "if_many",
					spacing = 2,
					format = function(diagnostic)
						local diagnostic_message = {
							[vim.diagnostic.severity.ERROR] = diagnostic.message,
							[vim.diagnostic.severity.WARN] = diagnostic.message,
							[vim.diagnostic.severity.INFO] = diagnostic.message,
							[vim.diagnostic.severity.HINT] = diagnostic.message,
						}
						return diagnostic_message[diagnostic.severity]
					end,
				},
			})

			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local servers = {
				lua_ls = {
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
							-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
							-- diagnostics = { disable = { 'missing-fields' } },
						},
					},
				},
			}
			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"stylua", -- Used to format Lua code
			})
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			require("mason-lspconfig").setup({
				ensure_installed = {}, -- explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
				automatic_installation = false,
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},

	{ -- Autoformat
		"stevearc/conform.nvim",
		--event = { 'BufWritePre' },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_format = "fallback" })
				end,
				mode = "",
				desc = "[F]ormat buffer",
			},
		},
		opts = {
			notify_on_error = false,
			format_on_save = function(bufnr)
				local disable_filetypes = { c = true, cpp = true }
				if disable_filetypes[vim.bo[bufnr].filetype] then
					return nil
				else
					return {
						timeout_ms = 500,
						lsp_format = "fallback",
					}
				end
			end,
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
			},
		},
	},

	{ -- Autocompletion
		"saghen/blink.cmp",
		event = "VimEnter",
		version = "1.*",
		dependencies = {
			-- Snippet Engine
			{
				"L3MON4D3/LuaSnip",
				version = "2.*",
				build = (function()
					-- Build Step is needed for regex support in snippets.
					-- This step is not supported in many windows environments.
					-- Remove the below condition to re-enable on windows.
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
				dependencies = {
					-- `friendly-snippets` contains a variety of premade snippets.
					--    See the README about individual language/framework/plugin snippets:
					--    https://github.com/rafamadriz/friendly-snippets
					-- {
					--   'rafamadriz/friendly-snippets',
					--   config = function()
					--     require('luasnip.loaders.from_vscode').lazy_load()
					--   end,
					-- },
				},
				opts = {},
			},
			"folke/lazydev.nvim",
		},
		--- @module 'blink.cmp'
		--- @type blink.cmp.Config
		opts = {
			keymap = {
				preset = "super-tab",
			},

			appearance = {
				nerd_font_variant = "normal",
			},

			completion = {
				documentation = { auto_show = false, auto_show_delay_ms = 500 },
			},

			sources = {
				default = { "lsp", "path", "snippets", "lazydev" },
				providers = {
					lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
				},
			},

			snippets = { preset = "luasnip" },
			fuzzy = { implementation = "prefer_rust_with_warning" },
			signature = { enabled = true },
		},
	},
	{ -- You can easily change to a different colorscheme.
		-- Change the name of the colorscheme plugin below, and then
		-- change the command in the config to whatever the name of that colorscheme is.
		--
		-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
--		"catppuccin/nvim",
--		priority = 1000, -- Make sure to load this before all the other start plugins.
--		config = function()
--			require("catppuccin").setup({
--				auto_integrations = true,
--				transparent_background = false,
--			})
--			vim.cmd.colorscheme("catppuccin-mocha")
--		end,
		'kepano/flexoki-neovim',
		name = 'flexoki',
		priority = 1000,
		config = function ()
			require('flexoki').setup({
			})
			vim.cmd.colorscheme('flexoki')
		end
	},

	--	{ -- You can easily change to a different colorscheme.
	--		-- Change the name of the colorscheme plugin below, and then
	--		-- change the command in the config to whatever the name of that colorscheme is.
	--		--
	--		-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
	--		"folke/tokyonight.nvim",
	--		priority = 1000, -- Make sure to load this before all the other start plugins.
	--		config = function()
	--			require("tokyonight").setup({
	--				transparent_background = false,
	--			})
	--			vim.cmd.colorscheme("tokyonight")
	--		end,
	--	},

	-- Highlight todo, notes, etc in comments
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},

	{ -- Collection of various small independent plugins/modules
		"echasnovski/mini.nvim",
		config = function()
			require("mini.ai").setup({ n_lines = 500 })
			require("mini.surround").setup()
		end,
	},
	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		main = "nvim-treesitter.configs", -- Sets main module to use for opts
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"diff",
				"html",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"query",
				"vim",
				"vimdoc",
			},
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "ruby" },
			},
			indent = { enable = true, disable = { "ruby" } },
		},
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		-- Optional dependencies
		dependencies = { { "nvim-mini/mini.icons", opts = {} } },
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
		-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
		lazy = false,
		config = function()
			require("oil").setup({
				columns = {
					"permissions",
					"icon",
				},
				view_options = {
					show_hidden = true,
				},
				lsp_file_methods = {
					enabled = true,
					timeout_ms = 1000,
					autosave_changes = true,
				},
				float = {
					max_width = 0.7,
					max_height = 0.6,
					border = "single",
				},
			})
		end,
	},
	{
		"chomosuke/typst-preview.nvim",
		lazy = false, -- or ft = 'typst'
		version = "1.*",
		opts = {}, -- lazy.nvim will implicitly calls `setup {}`
	},
	{
		"ahmeds0s/manim_runner.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"akinsho/toggleterm.nvim",
		},
		keys = {
			{
				"<localleader>cm",
				function()
					require("manim.render").render_scene()
				end,
				desc = "Render manim scene under cursor",
			},
		},
	},
	--	{
	--		"MeanderingProgrammer/render-markdown.nvim",
	--		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
	--		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
	--		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
	--		---@module 'render-markdown'
	--		---@type render.md.UserConfig
	--		opts = {},
	--		config = function()
	--			require("render-markdown").setup({
	--				render_modes = true,
	--				anti_conceal = {
	--					enabled = true,
	--				},
	--				pipe_table = {
	--					render_modes = true,
	--				},
	--				heading = {
	--					position = "inline",
	--					sign = false,
	--					width = "block",
	--					min_width = 10,
	--				},
	--				code = {
	--					width = "block",
	--					left_pad = 2,
	--					right_pad = 4,
	--				},
	--			})
	--		end,
	--	},
	--	{
	--		"zk-org/zk-nvim",
	--		config = function()
	--			require("zk").setup({
	--				-- Can be "telescope", "fzf", "fzf_lua", "minipick", "snacks_picker",
	--				-- or select" (`vim.ui.select`).
	--				picker = "telescope",
	--
	--				lsp = {
	--					-- `config` is passed to `vim.lsp.start(config)`
	--					config = {
	--						note_id_func = function(title)
	--							-- Simple slugify: lowercase, replace spaces with hyphens
	--							return title:gsub(" ", "-"):lower()
	--						end,
	--						name = "zk",
	--						cmd = { "zk", "lsp" },
	--						filetypes = { "markdown" },
	--						-- on_attach = ...
	--						-- etc, see `:h vim.lsp.start()`
	--					},
	--
	--					-- automatically attach buffers in a zk notebook that match the given filetypes
	--					auto_attach = {
	--						enabled = true,
	--					},
	--				},
	--			})
	--		end,
	--	},
	-- For `plugins.lua` users.
	{
		"OXY2DEV/markview.nvim",
		lazy = false,

		-- Completion for `blink.cmp`
		-- dependencies = { "saghen/blink.cmp" },
	},
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			bigfile = { enabled = true },
			dashboard = { enabled = false },
			explorer = { enabled = true },
			indent = { enabled = false },
			input = { enabled = true },
			picker = { enabled = true },
			notifier = { enabled = true },
			quickfile = { enabled = true },
			scope = { enabled = true },
			scroll = { enabled = false },
			statuscolumn = { enabled = true },
			words = { enabled = true },
			image = {
				enabled = true,
				force = false,
			},
		},
	},
--	{
--		"obsidian-nvim/obsidian.nvim",
--		version = "*", -- recommended, use latest release instead of latest commit
--		ft = "markdown",
--		-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
--		-- event = {
--		--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
--		--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
--		--   -- refer to `:h file-pattern` for more examples
--		--   "BufReadPre path/to/my-vault/*.md",
--		--   "BufNewFile path/to/my-vault/*.md",
--		-- },
--		---@module 'obsidian'
--		---@type obsidian.config
--		opts = {
--			completion = {
--				blink = false,
--			},
--			legacy_commands = false, -- this will be removed in the next major release
--			workspaces = {
----				{
----					name = "js",
----					path = "~/Documents/zk/js/",
----				},
--				{
--					name = "default",
--					path = "~/Documents/zk/",
--				},
--			},
--
--			-- see below for full list of options 👇
--		},
--	},
	{ "akinsho/toggleterm.nvim", version = "*", config = true },
	-- require 'kickstart.plugins.debug',
	require 'kickstart.plugins.indent_line',
	--require 'kickstart.plugins.lint',
	require("kickstart.plugins.autopairs"),
	--require 'kickstart.plugins.neo-tree',
	-- require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps
}, {
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})

vim.api.nvim_create_autocmd("BufNewFile", {
	pattern = "*daily.md",
	callback = function()
		vim.cmd("0r ~/realnotes/DailyNotes/Template.md")
	end,
})
vim.cmd([[set completeopt+=menuone,noselect,popup]])
