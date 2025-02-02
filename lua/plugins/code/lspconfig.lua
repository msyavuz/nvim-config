local servers = {
  "astro",
  "biome",
  "cssls",
  "csharp_ls",
  "dockerls",
  -- "elixirls",
  "eslint",
  "gopls",
  "jinja_lsp",
  "lua_ls",
  "nginx_language_server",
  "svelte",
  "rust_analyzer",
  -- "tsserver",
}

return {

  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "b0o/schemastore.nvim",
    -- Auto install servers
    {
      "williamboman/mason.nvim",
      opts = {},
    },
    {
      "williamboman/mason-lspconfig.nvim",
      opts = {
        automatic_installation = false,
      },
    },
  },
  config = function()
    local on_attach = require("constants").on_attach
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)
    local lspconfig = require("lspconfig")

    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end

    lspconfig.angularls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = { "ngserver", "--stdio", "--tsProbeLocations", "", "--ngProbeLocations", "" },
      filetypes = { "typescript", "html", "angular", "htmlangular" },
      root_dir = lspconfig.util.root_pattern("angular.json"),
    })

    lspconfig.emmet_language_server.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "html", "css", "angular", "heex" },
      init_options = {
        showExpandedAbbreviation = "inMarkupAndStylesheetFilesOnly",
      },
    })

    lspconfig.pyright.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "python" },
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "off",
          },
        },
      },
    })

    lspconfig.bashls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "sh", "zsh" },
    })

    lspconfig.tailwindcss.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = {
        "templ",
        "astro",
        "react",
        "htmldjango",
        "angular",
        "heex",
        "javascriptreact",
        "typescriptreact",
      },
      init_options = { userLanguages = { templ = "html", angular = "html", heex = "html" } },
      root_dir = function(fname)
        local root_pattern = require("lspconfig").util.root_pattern(
          "tailwind.config.cjs",
          "tailwind.config.mjs",
          "tailwind.config.js",
          "tailwind.config.ts",
          "postcss.config.js",
          "assets/tailwind.config.cjs",
          "assets/tailwind.config.js"
        )
        return root_pattern(fname)
      end,
    })
    lspconfig.html.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "html", "templ", "angular", "heex" },
    })

    -- lspconfig.htmx.setup({
    -- 	on_attach = on_attach,
    -- 	capabilities = capabilities,
    -- 	filetypes = { "html", "templ" },
    -- })

    lspconfig.jsonls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
    })

    lspconfig.lexical.setup({
      filetypes = { "elixir", "eelixir", "heex" },
      cmd = { "/home/msyavuz/.local/share/nvim/mason/bin/lexical" },
      settings = {},
      root_dir = function(fname)
        ---@diagnostic disable-next-line: undefined-field
        return lspconfig.util.root_pattern("mix.exs", ".git")(fname) or vim.loop.os_homedir()
      end,
    })
  end,
}
