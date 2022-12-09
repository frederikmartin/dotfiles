require'nvim-treesitter.configs'.setup {
    ensure_installed = { 'bash',
        'css',
        'dart',
        'dockerfile',
        'go',
        'hcl',
        'html',
        'java',
        'javascript',
        'json',
        'kotlin',
        'lua',
        'make',
        'markdown',
        'python',
        'ruby',
        'rust',
        'sql',
        'tsx',
        'typescript',
        'yaml',
        'vim'
    },
    auto_install = true,
    highlight = {
        enable = true
    }
}

