return {
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" },
      {
        "AstroNvim/astrolsp",
        opts = {
          mappings = {
            n = {
              gl = { "<cmd>Lspsaga show_line_diagnostics<CR>", desc = "Show Line Diagnostic" },
              gL = { "<cmd>Lspsaga show_buf_diagnostics<CR>", desc = "Show Buf Diagnostics" },
              gh = { "<cmd>Lspsaga finder<CR>", desc = "Lsp Finder" },
              ga = { "<cmd>Lspsaga code_action<CR>", desc = "Code Action" },
              gr = { "<cmd>Lspsaga rename ++project<CR>", desc = "Lsp Rename" },
              gd = { "<cmd>Lspsaga peek_definition<CR>", desc = "Peek Definition" },
              gD = { "<cmd>Lspsaga goto_definition<CR>", desc = "Goto Definition" },
              go = { "<cmd>Lspsaga outline<CR>", desc = "OutLine" },
              K = {
                function()
                  if vim.fn.expand "%:t" == "Cargo.toml" and require("crates").popup_available() then
                    require("crates").show_popup()
                  else
                    require("lspsaga.hover"):render_hover_doc()
                  end
                end,
                desc = "Hover Doc",
              },
            },
          },
        },
      },
    },
    opts = {
      definition = {
        keys = {
          edit = "<CR>",
        },
      },
      rename = {
        keys = {
          quit = "q",
        },
      },
      outline = {
        keys = {
          jump = "<CR>",
        },
      },
    },
  },
}
