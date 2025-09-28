-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set({ "n", "i" }, "<C-j>", "<cmd>bprevious<CR>", { desc = "Go to previous buffer" })
vim.keymap.set({ "n", "i" }, "<C-e>", "<C-w>h", { desc = "Focus/defocus explorer" })
vim.keymap.set("n", "<S-j>", "5j", { desc = "Big down" })
vim.keymap.set("n", "<S-k>", "5k", { desc = "Big up" })

vim.keymap.set("n", "dw", "wbdw", { desc = "Delete current word" })
vim.keymap.set("n", "yw", "wbyw", { desc = "Yank current word" })

vim.keymap.set("n", "<Leader>gbc", ":GitBlameCopyCommitURL<cr>", { desc = "Copy commit URL", silent = true })
vim.keymap.set("n", "<Leader>gbu", ":GitBlameCopyFileURL<cr>", { desc = "Copy gitlab URL", silent = true })
vim.keymap.set("n", "<Leader>gbt", ":GitBlameToggle<cr>", { desc = "Toggle git blame", silent = true })

vim.keymap.set("n", "x", '"_x')
vim.keymap.set("n", "<Leader>d", '"_d')

vim.keymap.set("n", "<C-d>", '"_d')
vim.keymap.set("n", "<S-d>", '"_<S-d>')
