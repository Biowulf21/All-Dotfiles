local null_ls = require("null-ls")
local ts_utils = require("nvim-treesitter.ts_utils")

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.snippets = {
	dart = {
		s("bloc_builder", {
			t("BlocBuilder<"),
			i(1, "Cubit"),
			t(", "),
			i(2, "State"),
			t({ ">(" }),
			t({ "  builder: (context, state) {", "    return " }),
			i(3),
			t({ ";", "  },", ")," }),
		}),
		s("bloc_provider", {
			t("BlocProvider<"),
			i(1, "Cubit"),
			t(">("),
			t({ "create: (_) => " }),
			i(2, "Cubit"),
			t({ ",", "child: " }),
			i(3),
			t({ ";", ")," }),
		}),
		s("repository_provider", {
			t("RepositoryProvider<"),
			i(1, "AbstractRepo"),
			t(">("),
			t({ "create: (_) => " }),
			i(2, "Repository"),
			t({ ",", "child: " }),
			i(3),
			t({ ";", ")," }),
		}),
		s("bloc_listener", {
			t("BlocListener<"),
			i(1, "Cubit"),
			t(", "),
			i(2, "State"),
			t({ ">(", "  listener: (context, state) {" }),
			t({ "    /// Add Code Here" }),
			t({ "  },", ")," }),
		}),
	},
}

local snippet_map = {
	["bloc_builder"] = [[
BlocBuilder<${1:Cubit}, ${2:State}>(
  builder: (context, state) {
    return %s;
  },
);]],
	["bloc_provider"] = [[
BlocProvider<${1:Cubit}>(
create: (_) => ${2:Cubit},
child: %s;
)
]],
	["repository_provider"] = [[
RepositoryProvider<${1:AbstractRepo}>(
create: (_) => ${2:Repository}(),
child: %s;
)
]],
	["bloc_listener"] = [[
BlocListener<${1:Cubit}, ${2:State}>(
  listener: (context, state) {
	  /// Add Code Here
  },
);]],
}

-- Determines if the current node in treesitter is a widget, therefore, a
-- a bloc widget can be wrapped around it
local function is_node_widget(node, params)
	local identifier = "identifier"

	if node == nil or node:type() ~= identifier then
		return false
	end

	return true
end

local function get_selector_node(node)
	local selecor_node = ts_utils.get_next_node(node)

	if selecor_node ~= nil then
		return selecor_node
	end

	return nil
end

local function wrap_with_bloc_component(node, key, snippet_val)
	-- The identifier node is the "text" of the widget, not including its
	-- arguments, children, etc.
	-- e.g Text
	local identifier_node = node
	-- The selector node is a sibling node to the identifier_node which
	-- selects the rest of its signature (arguments, children, etc)
	local selector_node = get_selector_node(node)
	if not identifier_node or not selector_node then
		print("No identifier or selector node found")
		return
	end

	-- Find the start and end positions from identifier to selector
	local start_row, start_col = identifier_node:start()
	local end_row, end_col = selector_node:end_()

	-- Extract the widget code from identifier to selector
	local widget_code = vim.api.nvim_buf_get_text(0, start_row, start_col, end_row, end_col, {})

	-- Combine the widget code
	local combined_code = table.concat(widget_code, "\n")

	-- Create the BlocBuilder snippet
	local snippet = ls.parser.parse_snippet(key, string.format(snippet_val, combined_code))

	-- Remove the original widget
	vim.api.nvim_buf_set_text(0, start_row, start_col, end_row, end_col, {})

	-- Insert the BlocBuilder snippet
	vim.api.nvim_win_set_cursor(0, { start_row + 1, start_col })
	ls.snip_expand(snippet)
end

null_ls.register({
	name = "flutter-bloc-code-actions",
	method = null_ls.methods.CODE_ACTION,
	filetypes = { "dart" },
	generator = {
		fn = function(params)
			local out = {}

			local node = vim.treesitter.get_node()

			if is_node_widget(node, params) then
				table.insert(out, {
					title = "Wrap with BlocBuilder",
					action = function()
						local key = "bloc_builder"
						local snippet = snippet_map[key]
						wrap_with_bloc_component(node, key, snippet)
					end,
				})

				table.insert(out, {
					title = "Wrap with BlocProvider",
					action = function()
						local key = "bloc_provider"
						local snippet = snippet_map[key]
						wrap_with_bloc_component(node, key, snippet)
					end,
				})

				table.insert(out, {
					title = "Wrap with RepositoryProvider",
					action = function()
						local key = "repository_provider"
						local snippet = snippet_map[key]
						wrap_with_bloc_component(node, key, snippet)
					end,
				})

				table.insert(out, {
					title = "Wrap with BlocListener",
					action = function()
						local key = "bloc_listener"
						local snippet = snippet_map[key]
						wrap_with_bloc_component(node, key, snippet)
					end,
				})
			end

			return out
		end,
	},
})
