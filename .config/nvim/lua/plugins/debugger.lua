return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-neotest/nvim-nio",
			"williamboman/mason.nvim",
		},
		config = function()
			local dap = require("dap")
			local ui = require("dapui")

			require("nvim-dap-virtual-text").setup({
				-- This just tries to mitigate the chance that I leak tokens here. Probably won't stop it from happening...
				display_callback = function(variable)
					local name = string.lower(variable.name)
					local value = string.lower(variable.value)
					if name:match("secret") or name:match("api") or value:match("secret") or value:match("api") then
						return "*****"
					end

					if #variable.value > 15 then
						return " " .. string.sub(variable.value, 1, 15) .. "... "
					end

					return " " .. variable.value
				end,
			})

			ui.setup()

			-- Dart CLI adapter (recommended)
			dap.adapters.dart = {
				type = "executable",
				command = "dart",
				args = { "debug_adapter" },
				-- windows users will need to set 'detached' to false
				-- options = {
				-- 	detached = false,
				-- },
			}
			dap.adapters.flutter = {
				type = "executable",
				command = "flutter",
				args = { "debug_adapter" },
				-- -- windows users will need to set 'detached' to false
				-- options = {
				-- 	detached = false,
				-- },
			}

			-- Key mappings with descriptions
			-- <leader>bb: Toggle Breakpoint
			vim.keymap.set("n", "<space>bb", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
			-- <leader>gb: Run to Cursor
			vim.keymap.set("n", "<space>gb", dap.run_to_cursor, { desc = "Run to Cursor" })
			-- <leader>bt: Toggle Debugger UI
			vim.keymap.set("n", "<space>bt", function()
				ui.toggle({ reset = true })
			end, { desc = "Toggle Debugger UI" })
			-- <leader>?: Evaluate variable under cursor
			vim.keymap.set("n", "<space>?", function()
				require("dapui").eval(nil, { enter = true })
			end, { desc = "Evaluate variable under cursor" })

			-- Function keys for debugging
			vim.keymap.set("n", "<F1>", dap.continue, { desc = "Continue" })
			vim.keymap.set("n", "<F2>", dap.step_into, { desc = "Step Into" })
			vim.keymap.set("n", "<F3>", dap.step_over, { desc = "Step Over" })
			vim.keymap.set("n", "<F4>", dap.step_out, { desc = "Step Out" })
			vim.keymap.set("n", "<F5>", dap.step_back, { desc = "Step Back" })
			vim.keymap.set("n", "<F6>", dap.restart, { desc = "Restart" })
		end,
	},
}
