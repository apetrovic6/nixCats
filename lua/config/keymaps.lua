--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-a>', '<C-w><C-h>', { noremap = true, desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-h>', '<C-w><C-l>', { noremap = true, desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-e>', '<C-w><C-j>', { noremap = true, desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-i>', '<C-w><C-k>', { noremap = true, desc = 'Move focus to the upper window' })

require('which-key').add { '<leader>m', desc = 'Misc' }
