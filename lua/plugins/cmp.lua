return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "lukas-reineke/cmp-rg",
  },
  opts = function(_, opts)
    local cmp = require "cmp"
    local snip_status_ok, luasnip = pcall(require, "luasnip")
    if not snip_status_ok then return end
    local neogen_status, neogen = pcall(require, "neogen")
    if not neogen_status then return end

    local function has_words_before()
      local line, col = (unpack or table.unpack)(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
    end

    opts.experimental = { ghost_text = true }
    opts.mapping["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }
    opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif neogen.jumpable() then
        neogen.jump_next()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" })
    opts.mapping["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      elseif neogen.jumpable(-1) then
        neogen.jump_prev()
      else
        fallback()
      end
    end, { "i", "s" })

    if not opts.sources then opts.sources = {} end
    table.insert(opts.sources, { name = "crates", priority = 250 })
    table.insert(opts.sources, { name = "rg", priority = 250 })
    -- opts.sources = cmp.config.sources {
    --   { name = "nvim_lsp", priority = 1000 },
    --   { name = "luasnip", priority = 750 },
    --   { name = "buffer", priority = 500 },
    --   { name = "path", priority = 250 },
    --   { name = "crates", priority = 250 },
    --   { name = "rg", priority = 250 },
    -- }
    -- return opts
  end,
}
