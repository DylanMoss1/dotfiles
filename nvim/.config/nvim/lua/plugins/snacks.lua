return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          files = {
            hidden = true,
            ignored = true,
            exclude = { ".venv", ".env", "env", "venv", "site-packages" },
          },
          explorer = {
            hidden = true,
            ignored = true,
            exclude = { ".venv", ".env", "env", "venv", "site-packages" },
          },
        },
        hidden = true,
        ignored = true,
      },
    },
  },
}
