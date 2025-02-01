return {
  'saghen/blink.cmp',
  dependencies = 'rafamadriz/friendly-snippets',

  version = '*',
  opts = {
    appearance = {
      nerd_font_variant = 'mono'
    },

    completion = {
      menu = {
        draw = {
          treesitter = { "lsp" },
          columns = {
            { "label", "label_description", gap = 1 },
            { "kind_icon", "kind" }
          },
        }
      },
      list = {
        selection = { preselect = true, auto_insert = true },
      },
    },

    keymap = {
      preset = "enter",
      ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
    },

    sources = {
      default = {'lazydev', 'lsp', 'path', 'snippets', 'buffer' },

      cmdline = {},

      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
      },
    },


    signature = {
      enabled = true
    },
  },
  opts_extend = { "sources.default" }
}
