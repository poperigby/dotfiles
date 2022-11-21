-- Friendly mapping function
local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Quick buffer switching
map("n", "<Leader><Tab>", ":bn<CR>")

-- Bind <Esc> to exit insert mode in terminal
map("t", "<Esc>", "<C-\\><C-n>", { noremap = true })

-- Toggle line numbers on/off
map("n", "<Leader>N", ":set invnumber<CR>")

-- Preview html file in firefox
map("n", "<Leader>p", ":silent update<Bar>silent !firefox -P Preview %:p &<CR>")

-- Yank to system regular clipboard
map("v", "<C-c>", '"+y')

-- Yank until end of line
map("n", "Y", "y$")

-- Termdebug
map("n", "<Leader>b", ":Break<CR>")
map("n", "<Leader>r", ":Run<CR>")
map("n", "<Leader>n", ":Over<CR>")
map("n", "<Leader>s", ":Step<CR>")

-- LSP bindings
map("n", "<space>,", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
map("n", "<space>;", "<cmd>lua vim.diagnostic.goto_next()<CR>")
map("n", "<space>a", "<cmd>lua vim.lsp.buf.code_action()<CR>")
map("n", "<space>d", "<cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "<space>h", "<cmd>lua vim.lsp.buf.hover()<CR>")
map("n", "<space>r", "<cmd>lua vim.lsp.buf.rename()<CR>")
map("n", "<space>m", "<cmd>lua vim.lsp.buf.references()<CR>")
map("n", "<space>s", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
map(
	"n",
	"<space>f",
	"<cmd>lua vim.lsp.buf.format({bufnr = bufnr, filter = function(client) return client.name == 'null-ls' end})<CR>"
)
map("n", "<space>t", "<cmd>TroubleToggle<cr>")
