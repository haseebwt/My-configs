-- Make nvim transparent
local function enable_transparency()
    vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
end
return {
    { 	--export theme
	'Biscuit-Theme/nvim',
	config = function()
	    vim.cmd.colorscheme "biscuit"
	    -- enable_transparency()
	end
    },
    {
	-- fancy line
	"nvim-lualine/lualine.nvim",
	dependencies = {
	    "nvim-tree/nvim-web-devicons"
	},
	opts = { 
	    theme = 'biscuit',
	}
    },
}
