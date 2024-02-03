local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>hh", mark.add_file, { desc = "Harpoon, append to list" })
vim.keymap.set("n", "<leader>hxx", mark.clear_all, { desc = "Harpoon, clear all marks" })
vim.keymap.set("n", "<leader>he", ui.toggle_quick_menu, { desc = "Harpoon, show quick menu" })

vim.keymap.set("n", "<leader>ha", function()
  ui.nav_file(1)
end, { desc = "Harpoon, navigate to file 1" })

vim.keymap.set("n", "<leader>hs", function()
  ui.nav_file(2)
end, { desc = "Harpoon, navigate to file 2" })

vim.keymap.set("n", "<leader>hd", function()
  ui.nav_file(3)
end, { desc = "Harpoon, navigate to file 3" })

vim.keymap.set("n", "<leader>hf", function()
  ui.nav_file(4)
end, { desc = "Harpoon, navigate to file 4" })

vim.keymap.set("n", "<leader>hxa", function()
  ui.nav_file(1)
end, { desc = "Harpoon, remove mark of file 1" })

vim.keymap.set("n", "<leader>hxs", function()
  ui.nav_file(2)
end, { desc = "Harpoon, remove mark of file 2" })

vim.keymap.set("n", "<leader>hxd", function()
  ui.nav_file(3)
end, { desc = "Harpoon, remove mark of file 3" })

vim.keymap.set("n", "<leader>hxf", function()
  ui.nav_file(4)
end, { desc = "Harpoon, remove mark of file 4" })
