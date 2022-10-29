local cmp = require "cmp"
local luasnip = require "luasnip"
return {
  preselect = cmp.PreselectMode.None,
  mapping = {
    ["<CR>"] = cmp.mapping.confirm { select = false },
    ["<Tab>"] = cmp.mapping(function(fallback)
      vim.api.nvim_feedkeys(vim.fn['copilot#Accept'](vim.api.nvim_replace_termcodes('<Tab>', true, true, true)), 'n',
        true)
    end)
    -- if luasnip.expandable() then
    --   luasnip.expand()
    -- elseif luasnip.expand_or_jumpable() then
    --   luasnip.expand_or_jump()
    --   fallback()
    -- end
    -- end, {
    -- "i",
    -- "s",
    -- }),
  },
  experimental = {
    ghost_text = false -- this feature conflict with copilot.vim's preview.
  }
}
