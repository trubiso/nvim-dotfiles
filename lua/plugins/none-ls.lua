return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.diagnostics.cppcheck,
				null_ls.builtins.formatting.clang_format,
				null_ls.builtins.formatting.isort,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.gofmt,
				null_ls.builtins.formatting.goimports,
				null_ls.builtins.formatting.golines,
				null_ls.builtins.diagnostics.golangci_lint,
			},
		})

		vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {})
	end,
}
