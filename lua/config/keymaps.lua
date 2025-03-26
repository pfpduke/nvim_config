-- **CUSTOM MAPPINGS**


local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<leader>q", ":q<CR>", opts)         -- Quit current window
map("n", "<leader>Q", ":qa<CR>", opts)        -- Quit all
map("n", "<leader>x", ":wq<CR>", opts)        -- Save and quit
map("n", "<leader>z", ":q!<CR>", opts)        -- Force quit


-- ** PLUGIN MAPPINGS**


-- Neo-tree
map("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle Neo-tree" })              -- Toggle

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find Files" })        -- Find files
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live Grep" })          -- Live grep (requires ripgrep)

