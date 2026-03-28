return {
  {
    "neovim/nvim-lspconfig",

    opts = {
      servers = {
        ["*"] = {
          keys = {
            { "K", false },
            { "L", "<cmd>lua vim.lsp.buf.hover()<CR>" },
          },
        },
      },
    },
  },
}
