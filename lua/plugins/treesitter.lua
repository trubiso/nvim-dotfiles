return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = {"lua", "c", "cpp", "bash", "asm", "rust", "go", "python", "javascript", "typescript", "make", "cmake", "json", "html", "css"},
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
