local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("lua", {
	-- s("hello", t("Hello, world!")),
	-- print for [ll], do print("...") end
	-- s("print", t("print(") .. i(1) .. t(")")),
})

-- print for [ll]
-- ls.add_snippets("lua", {
--   s("print", t("print(") .. i(1) .. t(")")),
-- })
