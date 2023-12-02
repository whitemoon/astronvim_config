-- AstroCore provides a central place to modify mappings set up as well as which-key menu titles
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
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

        -- mappings seen under group name "Buffer"
        -- ["<leader>bD"] = {
        --   function()
        --     require("astroui.status.heirline").buffer_picker(
        --       function(bufnr) require("astrocore.buffer").close(bufnr) end
        --     )
        --   end,
        --   desc = "Pick to close",
        -- },
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<leader>b"] = { desc = "Buffers" },
        -- quick save
        ["<C-s>"] = { "<cmd>w!<cr><esc>", desc = "Save File" }, -- change description but the same command
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
