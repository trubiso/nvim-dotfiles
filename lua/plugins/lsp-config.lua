return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "gopls", "pylsp" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local cfg = { capabilities = capabilities }
			local lsps = { "lua_ls", "rust_analyzer", "clangd", "gopls", "pylsp" }
			for _, lsp in ipairs(lsps) do
				vim.lsp.config(lsp, cfg)
				vim.lsp.enable({ lsp })
			end
			vim.lsp.inlay_hint.enable(true)

			vim.keymap.set("n", "<leader>p", "<Cmd>e#<CR>", {})
			vim.keymap.set("n", "<leader>s", "<Cmd>vsplit<CR><C-w>l", {})

			vim.diagnostic.config({
				virtual_text = {
					spacing = 4
				}
			})
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
			vim.keymap.set("n", "[d", function () vim.diagnostic.jump({ count = -1 }) end)
			vim.keymap.set("n", "]d", function () vim.diagnostic.jump({ count = 1 }) end)
			vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
			vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, {})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
