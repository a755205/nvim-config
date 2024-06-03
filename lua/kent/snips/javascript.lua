local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.conditions")
local conds_expand = require("luasnip.extras.conditions.expand")

-- snippets are added via ls.add_snippets(filetype, snippets[, opts]), where
-- opts may specify the `type` of the snippets ("snippets" or "autosnippets",
-- for snippets that should expand directly after the trigger is typed).
--
-- opts can also specify a key. By passing an unique key to each add_snippets, it's possible to reload snippets by
-- re-`:luafile`ing the file in which they are defined (eg. this one).
ls.add_snippets("javascript", {
	-- [ll] for console.log
	s("ll", { t("console.log("), i(1), t(");") }),
	-- fnc for arrow function
	s("fnc", {
		t("const "),
		i(1, "functionName"),
		t(" = ("),
		i(2, "params"),
		t(") => {"),
		i(0),
		t("}"),
	}),
	--
}, {
	key = "all",
})

-- ls.add_snippets("java", {
-- 	-- Very long example for a java class.
-- 	s("fn", {
-- 		d(6, jdocsnip, { 2, 4, 5 }),
-- 		t({ "", "" }),
-- 		c(1, {
-- 			t("public "),
-- 			t("private "),
-- 		}),
-- 		c(2, {
-- 			t("void"),
-- 			t("String"),
-- 			t("char"),
-- 			t("int"),
-- 			t("double"),
-- 			t("boolean"),
-- 			i(nil, ""),
-- 		}),
-- 		t(" "),
-- 		i(3, "myFunc"),
-- 		t("("),
-- 		i(4),
-- 		t(")"),
-- 		c(5, {
-- 			t(""),
-- 			sn(nil, {
-- 				t({ "", " throws " }),
-- 				i(1),
-- 			}),
-- 		}),
-- 		t({ " {", "\t" }),
-- 		i(0),
-- 		t({ "", "}" }),
-- 	}),
-- }, {
-- 	key = "java",
-- })

-- ls.add_snippets("tex", {
-- 	-- rec_ls is self-referencing. That makes this snippet 'infinite' eg. have as many
-- 	-- \item as necessary by utilizing a choiceNode.
-- 	s("ls", {
-- 		t({ "\\begin{itemize}", "\t\\item " }),
-- 		i(1),
-- 		d(2, rec_ls, {}),
-- 		t({ "", "\\end{itemize}" }),
-- 	}),
-- }, {
-- 	key = "tex",
-- })

-- set type to "autosnippets" for adding autotriggered snippets.
ls.add_snippets("all", {
	s("autotrigger", {
		t("autosnippet"),
	}),
}, {
	type = "autosnippets",
	key = "all_auto",
})

-- in a lua file: search lua-, then c-, then all-snippets.
ls.filetype_extend("lua", { "c" })
-- in a cpp file: search c-snippets, then all-snippets only (no cpp-snippets!!).
ls.filetype_set("cpp", { "c" })

-- Beside defining your own snippets you can also load snippets from "vscode-like" packages
-- that expose snippets in json files, for example <https://github.com/rafamadriz/friendly-snippets>.

require("luasnip.loaders.from_vscode").load({ include = { "python" } }) -- Load only python snippets

-- The directories will have to be structured like eg. <https://github.com/rafamadriz/friendly-snippets> (include
-- a similar `package.json`)
require("luasnip.loaders.from_vscode").load({ paths = { "./my-snippets" } }) -- Load snippets from my-snippets folder

-- You can also use lazy loading so snippets are loaded on-demand, not all at once (may interfere with lazy-loading luasnip itself).
require("luasnip.loaders.from_vscode").lazy_load() -- You can pass { paths = "./my-snippets/"} as well

-- You can also use snippets in snipmate format, for example <https://github.com/honza/vim-snippets>.
-- The usage is similar to vscode.

-- One peculiarity of honza/vim-snippets is that the file containing global
-- snippets is _.snippets, so we need to tell luasnip that the filetype "_"
-- contains global snippets:
ls.filetype_extend("all", { "_" })

require("luasnip.loaders.from_snipmate").load({ include = { "c" } }) -- Load only snippets for c.

-- Load snippets from my-snippets folder
-- The "." refers to the directory where of your `$MYVIMRC` (you can print it
-- out with `:lua print(vim.env.MYVIMRC)`.
-- NOTE: It's not always set! It isn't set for example if you call neovim with
-- the `-u` argument like this: `nvim -u yeet.txt`.
require("luasnip.loaders.from_snipmate").load({ path = { "./my-snippets" } })
-- If path is not specified, luasnip will look for the `snippets` directory in rtp (for custom-snippet probably
-- `~/.config/nvim/snippets`).

require("luasnip.loaders.from_snipmate").lazy_load() -- Lazy loading

-- see DOC.md/LUA SNIPPETS LOADER for some details.
require("luasnip.loaders.from_lua").load({ include = { "c" } })
require("luasnip.loaders.from_lua").lazy_load({ include = { "all", "cpp" } })
