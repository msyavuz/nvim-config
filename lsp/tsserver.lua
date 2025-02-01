vim.lsp.config.tsserver = {
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx',
  },
  root_markers = { "tsconfig.json", "jsconfig.json" },
  init_options = { hostInfo = "neovim" }
}
