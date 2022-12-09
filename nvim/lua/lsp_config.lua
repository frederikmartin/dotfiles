local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- LSP
require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'bashls',
        'cmake',
        'cssls',
        'dockerls',
        'gopls',
        'html',
        'jsonls',
        'tsserver',
        'sumneko_lua',
        'marksman',
        'pyright',
        'ruby_ls',
        'rust_analyzer',
        'sqlls',
        'terraformls',
        'lemminx',
        'yamlls'
    }
})

local on_attach = function()
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer=0 })
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer=0 })
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer=0 })
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer=0 })
    vim.keymap.set('n', 'gT', vim.lsp.buf.type_definition, { buffer=0 })
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer=0 })
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer=0 })
    vim.keymap.set('n', '<leader>f', vim.lsp.buf.formatting, { buffer=0 })
    vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, { buffer=0 })
    vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, { buffer=0 })
    -- TODO: vim.keymap.set('n', '<leader>dl', '<cmd>Telescope diagnostics<cr>', { buffer=0 })
end
-- Servers
require('lspconfig').bashls.setup {
    capabilities = capabilities,
    on_attach = on_attach
}
require('lspconfig').cmake.setup {
    capabilities = capabilities,
    on_attach = on_attach
}
require('lspconfig').cssls.setup {
    capabilities = capabilities,
    on_attach = on_attach
}
require('lspconfig').dockerls.setup {
    capabilities = capabilities,
    on_attach = on_attach
}
require('lspconfig').gopls.setup {
    capabilities = capabilities,
    on_attach = on_attach
}
require('lspconfig').html.setup {
    capabilities = capabilities,
    on_attach = on_attach
}
require('lspconfig').jsonls.setup {
    capabilities = capabilities,
    on_attach = on_attach
}
require('lspconfig').tsserver.setup {
    capabilities = capabilities,
    on_attach = on_attach
}
require('lspconfig').sumneko_lua.setup {
    capabilities = capabilities,
    on_attach = on_attach
}
require('lspconfig').marksman.setup {
    capabilities = capabilities,
    on_attach = on_attach
}
require('lspconfig').pyright.setup {
    capabilities = capabilities,
    on_attach = on_attach
}
require('lspconfig').ruby_ls.setup {
    capabilities = capabilities,
    on_attach = on_attach
}
require('lspconfig').rust_analyzer.setup {
    capabilities = capabilities,
    on_attach = on_attach
}
require('lspconfig').sqlls.setup {
    capabilities = capabilities,
    on_attach = on_attach
}
require('lspconfig').terraformls.setup {
    capabilities = capabilities,
    on_attach = on_attach
}
require('lspconfig').lemminx.setup {
    capabilities = capabilities,
    on_attach = on_attach
}
require('lspconfig').yamlls.setup {
    capabilities = capabilities,
    on_attach = on_attach
}

-- Auto-completion
vim.opt.completeopt={'menu', 'menuone', 'noselect'}
local cmp = require'cmp'

cmp.setup({
snippet = {
  expand = function(args)
    require('luasnip').lsp_expand(args.body)
  end,
},
mapping = cmp.mapping.preset.insert({
  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
  ['<C-f>'] = cmp.mapping.scroll_docs(4),
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<C-e>'] = cmp.mapping.abort(),
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
}),
sources = cmp.config.sources({
  { name = 'nvim_lsp' },
  { name = 'luasnip' },
}, {
  { name = 'buffer' },
})
})

cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' },
  }, {
    { name = 'buffer' },
  })
})

