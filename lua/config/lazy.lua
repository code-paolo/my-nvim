local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- LazyVim core plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },

    -- Your custom plugins folder
    { import = "plugins" },

    -- Neo-tree file explorer
    {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
      },
      config = function()
        require("neo-tree").setup({
          close_if_last_window = true,
          enable_git_status = true,
          enable_diagnostics = true,
          filesystem = {
            filtered_items = {
              visible = true, -- show hidden files
              hide_dotfiles = false, -- show dotfiles like .env
              hide_gitignored = false,
            },
          },
          default_component_configs = {
            icon = {
              folder_closed = "",
              folder_open = "",
              folder_empty = "ﰊ",
            },
            git_status = {
              symbols = {
                added = "+",
                modified = "~",
                deleted = "-",
                renamed = "→",
                untracked = "?",
              },
            },
          },
          window = {
            position = "left",
            width = 30,
            mapping_options = { noremap = true, nowait = true },
            mappings = {
              ["<CR>"] = "open",
              ["l"] = "open",
              ["h"] = "close_node",
              ["v"] = "open_vsplit",
              ["s"] = "open_split",
            },
          },
        })

        -- Optional keymap to toggle Neo-tree
        vim.api.nvim_set_keymap("n", "<leader>e", ":Neotree toggle<CR>", { noremap = true, silent = true })
      end,
    },
  },
  defaults = {
    lazy = false,
    version = false,
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = {
    enabled = true,
    notify = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
