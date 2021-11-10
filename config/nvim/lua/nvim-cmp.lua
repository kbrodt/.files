-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menu,menuone,noselect'

-- nvim-cmp setup
local cmp = require('cmp')

local check_back_space = function()
    local col = vim.fn.col '.' - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' ~= nil
end

cmp.setup {
  completion = {
      autocomplete = false
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    -- ['<Tab>'] = function(fallback)
      -- if cmp.visible() then
        -- cmp.select_next_item()
      -- else
        -- fallback()
      -- end
    -- end,
    -- ['<S-Tab>'] = function(fallback)
      -- if cmp.visible() then
        -- cmp.select_prev_item()
      -- else
        -- fallback()
      -- end
    -- end,
  },
  sources = {
    { name = 'nvim_lua' },
    { name = 'nvim_lsp' },
  },

  experimental = {
    native_menu = false,

    ghost_text = true,
  },
}
