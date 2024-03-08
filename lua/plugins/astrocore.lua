-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (lua_ls) as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = false,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = false, -- sets vim.opt.wrap

        spelllang = "en_us,cjk",
        fileencodings = "ucs-bom,utf-8,gbk,big5,gb18030,latin1",
        list = true,
        cursorcolumn = true,
        guicursor = "n-v-c-sm:hor20,i-ci-ve-r-cr-o:ver20,a:blinkon100",
        guifont = "GeistMono Nerd Font:h15",
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
        neovide_cursor_vfx_mode = "ripple",
        neovide_underline_automatic_scaling = true,
        neovide_hide_mouse_when_typing = true,
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs with `H` and `L`
        L = {
          function() require("astrocore.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
          desc = "Next buffer",
        },
        H = {
          function() require("astrocore.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
          desc = "Previous buffer",
        },

        ["<leader>fp"] = {
          "<cmd>Telescope projects<cr>",
          desc = "Find projects",
        },

        ["<leader>fT"] = {
          "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>",
          desc = "Find Todo/Fix/Fixme",
        },
        ["<C-s>"] = { "<cmd>w!<cr><esc>", desc = "Save File" }, -- change description but the same command
        -- mappings seen under group name "Buffer"
        -- ["<Leader>bD"] = {
        --   function()
        --     require("astroui.status.heirline").buffer_picker(
        --       function(bufnr) require("astrocore.buffer").close(bufnr) end
        --     )
        --   end,
        --   desc = "Pick to close",
        -- },
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },
        -- quick save
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
      },
      v = {
        ["<leader>f"] = { desc = require("astroui").get_icon("Find", 1, true) .. "Find" },
        ["<leader>fw"] = {
          function() require("telescope.builtin").grep_string() end,
          desc = "Find visual range words",
        },
      },
      i = {
        ["<C-s>"] = { "<cmd>w!<cr><esc>", desc = "Save File" }, -- change description but the same command
        ["<C-a>"] = { "<ESC>^i", desc = "Goto Line First" }, -- change description but the same command
        ["<C-e>"] = { "<End>", desc = "Goto Line End" }, -- change description but the same command
      },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
        ["<esc><esc>"] = { "<c-\\><c-n>", desc = "Enter Normal Mode" },
      },
    },
  },
}
