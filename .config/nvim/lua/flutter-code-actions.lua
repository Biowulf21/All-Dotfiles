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
			t({ ";", "  },", ")" }),
		}),
		s("bloc_provider", {
			t("BlocProvider<"),
			i(1, "Cubit"),
			t(">("),
			t({ "create: (_) => " }),
			i(2, "Cubit"),
			t({ ",", "child: " }),
			i(3),
			t({ ";", ")" }),
		}),
		s("repository_provider", {
			t("RepositoryProvider<"),
			i(1, "AbstractRepo"),
			t(">("),
			t({ "create: (_) => " }),
			i(2, "Repository"),
			t({ ",", "child: " }),
			i(3),
			t({ ";", ")" }),
		}),
		s("bloc_listener", {
			t("BlocListener<"),
			i(1, "Cubit"),
			t(", "),
			i(2, "State"),
			t({ ">(", "  listener: (context, state) {" }),
			t({ "    /// Add Code Here" }),
			t({ "  },", ")" }),
		}),
	},
}

local repository_providers = [[
RepositoryProvider<Repo1>(
  create: (_) => Repo1(),
),
RepositoryProvider<Repo2>(
  create: (_) => Repo2(),
)
]]

local bloc_providers = [[
    BlocProvider<BlocA>(
      create: (BuildContext context) => BlocA(),
    ),
    BlocProvider<BlocB>(
      create: (BuildContext context) => BlocB(),
    ),
]]

local listeners = [[
    BlocListener<BlocA, BlocAState>(
      listener: (context, state) {
	/// Add Code Here
      },
    ),
    BlocListener<BlocB, BlocBState>(
      listener: (context, state) {
	/// Add Code Here
      },
    ),
]]

local snippet_map = {
	["bloc_builder"] = [[
BlocBuilder<${1:Cubit}, ${2:State}>(
  builder: (context, state) {
    return %s;
  },
)
]],
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
)
]],
	["multi_repository_provider"] = [[
MultiRepositoryProvider(
  providers: [
    %s
  ],
  child: ${1:ChildWidget},
)
]],

	["multi_bloc_provider"] = [[
MultiBlocProvider(
  providers: [
    %s
  ],
  child: ${1:ChildWidget},
)
]],

	["multi_bloc_listener"] = [[
MultiBlocListener(
  listeners: [
    %s
  ],
  child: ${1:ChildWidget},
)
]],
}

local function is_node_function(current_node)
	local parent_node = current_node:parent()
	local type = parent_node:type()

	if type == "local_function_declaration" or type == "function_declaration" then
		return true
	end

	return false
end

-- Determines if the current node in treesitter is a widget, therefore, a
-- a bloc widget can be wrapped around it
local function is_node_widget(node)
	local type = node:type()
	local identifier = "identifier"
	-- This is for SizedBoxes
	local type_indentifier = "type_identifier"

	if node == nil or (type ~= identifier and type ~= type_indentifier) or is_node_function(node) then
		return false
	end

	return true
end

local function table_contains(table, element)
	for _, type in ipairs(table) do
		if type == element then
			return true
		end
	end
	return false
end

-- This determines if the current node can be converted to a multiple form
-- e.g RepositoryProvider -> MultiRepositoryProvider
local function is_repository_provider(node)
	local node_text = vim.treesitter.get_node_text(node, 0)
	return node_text == "RepositoryProvider"
end

local function is_bloc_provider(node)
	local node_text = vim.treesitter.get_node_text(node, 0)
	return node_text == "BlocProvider"
end

local function is_bloc_listener(node)
	local node_text = vim.treesitter.get_node_text(node, 0)
	return node_text == "BlocListener"
end

local function get_selector_node(node)
	local selecor_node = ts_utils.get_next_node(node)

	if selecor_node ~= nil then
		return selecor_node
	end

	return nil
end

local function is_return_statement(node)
	while node do
		if node:type() == "return_statement" then
			return true
		end
		node = node:parent()
	end
	return false
end

local function wrap_with_bloc_component(node, key, snippet_val)
	local identifier_node = node
	local selector_node = get_selector_node(node)
	if not identifier_node or not selector_node then
		print("No identifier or selector node found")
		return
	end

	local start_row, start_col = identifier_node:start()
	local end_row, end_col = selector_node:end_()

	local widget_code = vim.api.nvim_buf_get_text(0, start_row, start_col, end_row, end_col, {})
	local combined_code = table.concat(widget_code, "\n")

	local context_snippet_val = snippet_val
	local parent_node = node:parent()
	if is_return_statement(parent_node) then
		context_snippet_val = context_snippet_val:gsub(";", ",")
	end

	local snippet = ls.parser.parse_snippet(key, string.format(context_snippet_val, combined_code))

	vim.api.nvim_buf_set_text(0, start_row, start_col, end_row, end_col, {})
	vim.api.nvim_win_set_cursor(0, { start_row + 1, start_col })
	ls.snip_expand(snippet)
end

local function convert_to_multi_repository_provider(node) end
local function convert_to_multi_bloc_provider(node) end
local function convert_to_multi_bloc_listener(node) end

local function convert_to_multiple_form(node, key, snippet)
	local node_text = vim.treesitter.get_node_text(node, 0)

	if node_text == "RepositoryProvider" then
		convert_to_multi_repository_provider(node)
	elseif node_text == "BlocProvider" then
		convert_to_multi_bloc_provider(node)
	elseif node_text == "BlocListener" then
		convert_to_multi_bloc_listener(node)
	end
end

-- Adds an action to the code actions list
local function add_action(out, node, key, title, convert_function)
	table.insert(out, {
		title = title,
		action = function()
			local snippet = snippet_map[key]
			convert_function(node, key, snippet)
		end,
	})
end

null_ls.register({
	name = "flutter-bloc-code-actions",
	method = null_ls.methods.CODE_ACTION,
	filetypes = { "dart" },
	generator = {
		fn = function()
			local out = {}
			local node = vim.treesitter.get_node()

			if node and is_node_widget(node) then
				if is_bloc_listener(node) then
					add_action(
						out,
						node,
						"multi_bloc_listener",
						"Convert to MultiBlocListener",
						convert_to_multiple_form
					)
				end

				if is_bloc_provider(node) then
					add_action(
						out,
						node,
						"multi_bloc_provider",
						"Convert to MultiBlocProvider",
						convert_to_multiple_form
					)
				end

				if is_repository_provider(node) then
					add_action(
						out,
						node,
						"multi_repository_provider",
						"Convert to MultiRepositoryProvider",
						convert_to_multiple_form
					)
				end

				add_action(out, node, "bloc_builder", "Wrap with BlocBuilder", wrap_with_bloc_component)
				add_action(out, node, "bloc_provider", "Wrap with BlocProvider", wrap_with_bloc_component)
				add_action(out, node, "repository_provider", "Wrap with RepositoryProvider", wrap_with_bloc_component)
				add_action(out, node, "bloc_listener", "Wrap with BlocListener", wrap_with_bloc_component)
			end

			return out
		end,
	},
})
