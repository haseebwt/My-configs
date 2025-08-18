vim.opt.number = true -- line numbers
vim.opt.cursorline = true -- self explainatory
vim.opt.shiftwidth = 4 -- tab spaces
vim.opt.clipboard = 'unnamedplus' -- use system clipboard
vim.opt.ignorecase = true -- ignore case in search

-- set to `true` to follow the main branch
-- you need to have a working rust toolchain to build the plugin
-- in this case.
vim.g.lazyvim_blink_main = false
