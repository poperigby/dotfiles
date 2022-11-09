local lspconfig = require("lspconfig")

-- Change diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Format on save function
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local on_attach =
	function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
	
	-- Mason setup
mason.setup({})
-- Automatically setup servers installed with mason.nvim
require("mason-lspconfig").setup_handlers({
	-- Default handler
	function(server_name)
		lspconfig[server_name].setup({
			on_attach = on_attach,
		})
	end,
	-- Targetted overrides for specific servers
	["sumneko_lua"] = function()
		lspconfig.sumneko_lua.setup({
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim", "minetest" },
					},
				},
			},
		})
	end,
})

-- Mason null-ls
mason_null_ls.setup()
mason_null_ls.setup_handlers({
	function(source_name)
		-- all sources with no handler get passed here
	end,
})

-- null-ls
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.clang_format,
		null_ls.builtins.formatting.stylua,
	},
	on_attach = on_attach,
})

-- Mason null-ls
require("mason-null-ls").setup({
	automatic_setup = true,
})
-- require("mason-null-ls").setup_handlers()

-- Fix for multiple offset encoding error
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = { "utf-16" }
require("lspconfig").clangd.setup({ capabilities = capabilities })
