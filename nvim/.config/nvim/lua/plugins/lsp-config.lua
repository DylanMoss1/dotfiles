return {
  {
    "neovim/nvim-lspconfig",

    opts = {
      servers = {
        ["*"] = {
          keys = {
            { "K", false },
            { "H", "<cmd>lua vim.lsp.buf.hover()<CR>" },
          },
        },
      },
    },
  },
}
