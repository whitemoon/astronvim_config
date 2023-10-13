-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    features = {
      inlay_hints = vim.fn.has "nvim-0.10",
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = false,
      underline = true,
    },
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        -- "lua_ls",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
    -- customize language server configuration options passed to `lspconfig`
    config = {
      -- clangd = { capabilities = { offsetEncoding = "utf-8" } },
    },
    -- customize how language servers are attached
    setup_handlers = {
      -- a function without a key is simply the default handler, functions take two parameters, the server name and the configured options table for that server
      -- function(server, opts) require("lspconfig")[server].setup(opts) end

      -- the key is the server that is being setup with `lspconfig`
      -- rust_analyzer = false, -- setting a handler to false will disable the set up of that language server
      -- pyright = function(_, opts) require("lspconfig").pyright.setup(opts) end -- or a custom handler function can be passed
    },
    -- mappings to be set up on attaching of a language server
    mappings = {
      n = {
        -- gl = { function() vim.diagnostic.open_float() end, desc = "Hover diagnostics" },
        gl = { "<cmd>Lspsaga show_line_diagnostics<CR>", desc = "Show Line Diagnostic" },
        gL = { "<cmd>Lspsaga show_buf_diagnostics<CR>", desc = "Show Buf Diagnostics" },
        gh = { "<cmd>Lspsaga finder<CR>", desc = "Lsp Finder" },
        ga = { "<cmd>Lspsaga code_action<CR>", desc = "Code Action" },
        gr = { "<cmd>Lspsaga rename ++project<CR>", desc = "Lsp Rename" },
        gd = { "<cmd>Lspsaga peek_definition<CR>", desc = "Peek Definition" },
        gD = { "<cmd>Lspsaga goto_definition<CR>", desc = "Goto Definition" },
        go = { "<cmd>Lspsaga outline<CR>", desc = "OutLine" },
        K = { "<cmd>Lspsaga hover_doc<CR>", desc = "Hover Doc" },
        -- a `cond` key can provided as the string of a server capability to be required to attach, or a function with `client` and `bufnr` parameters from the `on_attach` that returns a boolean
        -- gD = {
        --   function() vim.lsp.buf.declaration() end,
        --   desc = "Declaration of current symbol",
        --   cond = "textDocument/declaration",
        -- },
        -- ["<leader>uY"] = {
        --   function() require("astrolsp.toggles").buffer_semantic_tokens() end,
        --   desc = "Toggle LSP semantic highlight (buffer)",
        --   cond = function(client) return client.server_capabilities.semanticTokensProvider and vim.lsp.semantic_tokens end,
        -- },
      },
      t = {},
    },
  },
}
