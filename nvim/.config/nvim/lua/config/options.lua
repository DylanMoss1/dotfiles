-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.clipboard = "unnamedplus"

-- local function paste()
--   return { vim.split(vim.fn.getreg(""), "\n"), vim.fn.getregtype("") }
-- end
--
-- local function copy(lines)
--   require("osc52").copy(table.concat(lines, "\n"))
-- end
--
-- vim.g.clipboard = {
--   name = "osc52",
--   copy = { ["+"] = copy, ["*"] = copy },
--   paste = { ["+"] = paste, ["*"] = paste },
-- }
