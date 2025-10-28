return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		require("telescope").setup({})
		local builtin = require('telescope.builtin')
        	vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "Find files"})
        	vim.keymap.set('n', '<leader>fs', builtin.live_grep, {desc = "Find word"})
        	vim.keymap.set('n', '<leader>fg', builtin.git_files, {desc = "Find git files"})
        	vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = "Find buffer files"})
		vim.keymap.set('n', '<leader>sw', function()
            		local word = vim.fn.expand("<cword>")
            		builtin.grep_string({ search = word })
        	end)
        	vim.keymap.set('n', '<leader>sW', function()
			local word = vim.fn.expand("<cWORD>")
			builtin.grep_string({ search = word })
		end)
	end
    }
