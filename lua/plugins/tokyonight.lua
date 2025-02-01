--TokyoNight
return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      light_style = "day",
      style = "night",
      transparent = true,
      on_colors = function(_) end,
      on_highlights = function(hl, c)
        local prompt = "#2d3149"
        hl.DiffDelete = {
          bg = c.green2,
          fg = c.bg_dark,
        }
        hl.DiffChange = {
          bg = c.red,
          fg = c.bg_dark,
        }
        hl.TelescopeNormal = {
          bg = c.bg_dark,
          fg = c.fg_dark,
        }
        hl.TelescopeBorder = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        hl.TelescopePromptBorder = {
          fg = prompt,
        }
        hl.TelescopePromptTitle = {
          fg = prompt,
        }
        hl.TelescopePreviewTitle = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        hl.TelescopeResultsTitle = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
      end,
      styles = {
        keywords = { italic = false },
        functions = { italic = false },
        variables = { italic = false },
      },
    })
    vim.cmd([[colorscheme tokyonight]])
  end,
}
