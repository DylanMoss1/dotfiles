-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set({ "n", "i" }, "<C-k>", "<cmd>bnext<CR>", { desc = "Go to next buffer" })
vim.keymap.set({ "n", "i" }, "<C-j>", "<cmd>bprevious<CR>", { desc = "Go to previous buffer" })

vim.keymap.set({ "n", "i" }, "<C-e>", "<C-w>h", { desc = "Focus/defocus explorer" })

vim.keymap.set({ "n", "v" }, "<S-j>", "5j", { desc = "Big down" })
vim.keymap.set({ "n", "v" }, "<S-k>", "5k", { desc = "Big up" })

vim.keymap.set("n", "<Leader>gbc", ":GitBlameCopyCommitURL<cr>", { desc = "Copy commit URL", silent = true })
vim.keymap.set("n", "<Leader>gbu", ":GitBlameCopyFileURL<cr>", { desc = "Copy gitlab URL", silent = true })
vim.keymap.set("n", "<Leader>gbt", ":GitBlameToggle<cr>", { desc = "Toggle git blame", silent = true })

vim.keymap.set("n", "x", '"_x')
vim.keymap.set("n", "<C-d>", '"_d')
vim.keymap.set("n", "<C-D>", '"_D')

vim.keymap.set("n", "<C-a>", "ggVG")

vim.keymap.set({ "n", "i", "t" }, "<C-A-j>", "<C-\\><C-N><C-w>h")
vim.keymap.set({ "n", "i", "t" }, "<C-A-k>", "<C-\\><C-N><C-w>l")
vim.keymap.set({ "n", "i", "t" }, "<C-A-h>", "<C-\\><C-N><C-w>k<C-N><C-w>l")
vim.keymap.set({ "n", "i", "t" }, "<C-A-l>", "<C-\\><C-N><C-w>j")

vim.keymap.set({ "n", "t" }, "<C-d>", "<C-\\><C-N><cmd>close<cr><C-w>l")
