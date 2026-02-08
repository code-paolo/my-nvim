return {
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = false,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = { bold = true },
        variables = {},
        sidebars = "dark",
        floats = "dark",
      },
      sidebars = {
        "qf",
        "help",
        "vista_kind",
        "terminal",
        "packer",
        "neo-tree",
        "Trouble",
        "lazy",
        "mason",
      },
      day_brightness = 0.3,
      hide_inactive_statusline = false,
      dim_inactive = false,
      lualine_bold = true,
    },
    config = function(_, opts)
      require("solarized-osaka").setup(opts)
      vim.cmd([[colorscheme solarized-osaka]])

      -- Apply theme to all components
      vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
      vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
      vim.api.nvim_set_hl(0, "TelescopeBorder", { link = "Normal" })
      vim.api.nvim_set_hl(0, "TelescopeNormal", { link = "Normal" })
      vim.api.nvim_set_hl(0, "WhichKeyFloat", { link = "Normal" })
      vim.api.nvim_set_hl(0, "LspInfoBorder", { link = "Normal" })
      vim.api.nvim_set_hl(0, "MasonNormal", { link = "Normal" })
      vim.api.nvim_set_hl(0, "LazyNormal", { link = "Normal" })
    end,
  },
}
