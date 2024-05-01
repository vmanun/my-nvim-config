local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>hh", mark.add_file, { desc = "Harpoon, append to list" })
vim.keymap.set("n", "<leader>hxx", mark.clear_all, { desc = "Harpoon, clear all marks" })
vim.keymap.set("n", "<leader>he", ui.toggle_quick_menu, { desc = "Harpoon, show quick menu" })

for i = 0,1, 1 do
    vim.keymap.set("n", "<leader>h" .. i, function()
      ui.nav_file(1)
    end, { desc = "Harpoon, navigate to file " .. i })

    vim.keymap.set("n", "<leader>hx" .. i, function()
      ui.nav_file(1)
    end, { desc = "Harpoon, remove mark of file " .. i })
end
