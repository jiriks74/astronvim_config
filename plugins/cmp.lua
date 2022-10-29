local kind_icons = {
  NONE = "",
  Array = "",
  Boolean = "⊨",
  Class = "",
  Constructor = "",
  Key = "",
  Namespace = "",
  Null = "NULL",
  Number = "#",
  Object = "⦿",
  Package = "",
  Property = "",
  Reference = "",
  Snippet = "",
  String = "𝓐",
  TypeParameter = "",
  Unit = "",

  Text = "",
  Method = "",
  Function = "",
  Field = "ﰠ",
  Variable = "",
  Interface = "",
  Module = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Color = "",
  File = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "פּ",
  Event = "",
  Operator = "",
  Copilot = "",
}
local cmp = require("cmp")
-- local has_words_before = function()
--   if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
--   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--   return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
-- end
return {
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(_, vim_item)
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      return vim_item
    end,
  },
  -- completion = {
  --   keyword_length = 0,
  -- },
  -- mapping = {
    --   ["<Tab>"] = vim.schedule_wrap(function(fallback)
    --     if cmp.visible() and has_words_before() then
    --       cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
    --     else
    --       fallback()
    --     end
    --   end),
  --   ['<Tab>'] = cmp.mapping(function(fallback)
  --     if vim.fn['vsnip#jumpable'](1) == 1 then
  --       feedkey('<Plug>(vsnip-jump-next)', '')
  --     else
  --       local copilot_keys = vim.fn['copilot#Accept']()
  --       if copilot_keys ~= '' then
  --         vim.api.nvim_feedkeys(copilot_keys, 'i', true)
  --       else
  --         fallback()
  --       end
  --     end
  --   end, { 'i', 's' }),
  -- },
}
-- local cmp = require "cmp"
-- local luasnip = require "luasnip"
-- return {
--   preselect = cmp.PreselectMode.None,
--   mapping = {
--     ["<CR>"] = cmp.mapping.confirm { select = false },
--     ["<Tab>"] = cmp.mapping(function(fallback)
--       if luasnip.expandable() then
--         luasnip.expand()
--       elseif luasnip.expand_or_jumpable() then
--         luasnip.expand_or_jump()
--         fallback()
--       end
--     end, {
--       "i",
--       "s",
--     }),
--   },
-- }
