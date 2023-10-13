return {
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    cmd = { "Lspsaga" },
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" },
    },
    opts = {},
  },
}
