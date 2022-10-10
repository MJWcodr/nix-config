lspconfig = require'lspconfig'
completion_callback = require'completion'.on_attach

lspconfig.pylsp.setup{on_attach=completion_callback}
lspconfig.tsserver.setup{on_attach=completion_callback}
lspconfig.rust_analyzer.setup{on_attach=completion_callback}

