-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/AstroNvim/AstroNvim/blob/main/lua/astronvim/options.lua
-- Add any additional options here

-- vim.opt.relativenumber = true -- sets vim.opt.relativenumber
-- vim.opt.number = true -- sets vim.opt.number
-- vim.opt.spell = false -- sets vim.opt.spell
-- vim.opt.signcolumn = "auto" -- sets vim.opt.signcolumn to auto
-- vim.opt.wrap = false -- sets vim.opt.wrap

-- vim.g.mapleader = " " -- sets vim.g.mapleader

vim.opt.spelllang = "en_us,cjk"
vim.opt.fileencodings = "ucs-bom,utf-8,gbk,big5,gb18030,latin1"
vim.o.guifont = "Iosevka Nerd Font Mono:h15"

if vim.g.neovide then
  vim.g.neovide_cursor_vfx_mode = "ripple"
  vim.g.neovide_underline_automatic_scaling = true
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0
  vim.g.neovide_scroll_animation_length = 0.3
end
