return {
   "CRAG666/code_runner.nvim",
   config = function()
       require("code_runner").setup({
           filetype = {
               rust = "cargo run"
           }
       })

       vim.keymap.set('n', '<leader>rr', ':RunCode<CR>', { noremap = true, silent = false })
   end
}
