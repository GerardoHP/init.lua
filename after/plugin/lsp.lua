-- nvim/lua/gerardohp/lsp.lua

local lsp_zero = require('lsp-zero')

-- Apply default keymaps when an LSP attaches to a buffer
lsp_zero.on_attach(function(client, bufnr)
  -- Examples: gd (go to definition), K (hover documentation)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- Setup Mason to manage external editor tools
require('mason').setup({})
require('mason-lspconfig').setup({
  -- Install these servers automatically
  ensure_installed = {'omnisharp', 'sqlls', 'lua_ls', 'go', 'javascript', 'typescript', },
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  },
})

-- Autocompletion configuration
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    -- Confirm selection with Enter
    ['<CR>'] = cmp.mapping.confirm({select = false}),
    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),
    -- Navigate between snippets placeholders
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
  })
})
