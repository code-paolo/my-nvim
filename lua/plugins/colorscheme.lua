return {
  {
    "olimorris/onedarkpro.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      theme = "onedark", -- One Dark Pro (default VS Code look)

      options = {
        transparency = false,
        terminal_colors = true,
        highlight_inactive_windows = false,
      },

      styles = {
        comments = "italic",
        keywords = "italic",
        functions = "bold",
        variables = "NONE",
      },

      highlights = {
        -- Make floats & popups match main background
        NormalFloat = { link = "Normal" },
        FloatBorder = { link = "Normal" },
        TelescopeBorder = { link = "Normal" },
        TelescopeNormal = { link = "Normal" },
        WhichKeyFloat = { link = "Normal" },
        LspInfoBorder = { link = "Normal" },
        MasonNormal = { link = "Normal" },
        LazyNormal = { link = "Normal" },
      },
    },
    config = function(_, opts)
      require("onedarkpro").setup(opts)
      vim.cmd("colorscheme onedark")
    end,
  },
}
