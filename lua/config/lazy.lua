local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or vim.loop.fs_stat(lazypath)) then
  vim.g.astronvim_first_install = true -- lets AstroNvim know that this is an initial installation
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)
local lazy_loaded, lazy = pcall(require, "lazy") -- validate that lazy is available
if not lazy_loaded then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

require("lazy").setup ({
  -- TODO: change `branch="v4"` to `version="^4"` on release
  { "AstroNvim/AstroNvim", branch = "v4", import = "astronvim.plugins" },
    -- AstroCommunity import any community modules here
    -- TODO: Remove branch v4 on release
    { "AstroNvim/astrocommunity", branch = "v4" },
    { import = "astrocommunity.pack.lua" },
    { import = "astrocommunity.pack.bash" },
    { import = "astrocommunity.pack.cpp" },
    { import = "astrocommunity.pack.python-ruff" },
    { import = "astrocommunity.pack.rust" },
    { import = "astrocommunity.pack.toml" },
    { import = "astrocommunity.pack.json" },
    { import = "astrocommunity.pack.markdown" },
    { import = "astrocommunity.editing-support.neogen" },
    { import = "astrocommunity.editing-support.multicursors-nvim" },
    { import = "astrocommunity.editing-support.todo-comments-nvim" },
    { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
    { import = "astrocommunity.editing-support.conform-nvim" },
    { import = "astrocommunity.project.project-nvim" },
    { import = "astrocommunity.project.nvim-spectre" },
    { import = "astrocommunity.motion.flash-nvim" },
    { import = "astrocommunity.motion.nvim-surround" },
    { import = "astrocommunity.git.diffview-nvim" },
    { import = "astrocommunity.lsp.lsp-signature-nvim" },
    { import = "astrocommunity.code-runner.sniprun" },
    { import = "astrocommunity.recipes.heirline-nvchad-statusline" },
    { import = "astrocommunity.recipes.heirline-vscode-winbar" },
    { import = "astrocommunity.scrolling.neoscroll-nvim" },
    { import = "astrocommunity.colorscheme.catppuccin" },
    { import = "plugins" }, -- import/override with your plugins
} --[[@as LazySpec]], {
  install = { colorscheme = { "astrodark", "habamax" } },
  performance = {
    rtp = {
      -- disable some rtp plugins, add more to your liking
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "zipPlugin",
      },
    },
  },
} --[[@as LazyConfig]])
