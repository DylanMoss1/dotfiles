return {
  {
    "neovim/nvim-lspconfig",

    opts = {
      setup = {
        ["*"] = function(_, _)
          local keys = require("lazyvim.plugins.lsp.keymaps").get()
          keys[#keys + 1] = { "K", false }
          keys[#keys + 1] = { "H", "<cmd>lua vim.lsp.buf.hover()<CR>" }
        end,
      },
    },
  },
}
