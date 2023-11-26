function colorMyPencils(color)
   color = color or "gruvbox-baby"
   vim.cmd.colorscheme("gruvbox-baby")

   vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
   vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

colorMyPencils()
