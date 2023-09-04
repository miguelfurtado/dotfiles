local function nmap(keys, action)
  vim.keymap.set("n", keys, action, {silent=true})
end

-- general
nmap("<leader>w", "<cmd>lua vim.cmd('w')<CR>")
nmap("<leader>ee", "<cmd>lua vim.diagnostic.open_float()<CR>")
nmap("<leader>E", "<cmd>lua vim.cmd('Ex')<CR>")

-- telescope
nmap("<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<CR>")
nmap("<leader>sw", "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>")
nmap("<leader>ss", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>")
nmap("<leader>dg", "<cmd>lua require('telescope.builtin').diagnostics()<CR>")
nmap("<leader>gg", "<cmd>lua require('telescope.builtin').live_grep()<CR>")
nmap("<leader>gr", "<cmd>lua require('telescope.builtin').lsp_references()<CR>")

-- harpoon
nmap("<leader>hh", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>")
nmap("<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<CR>")
nmap("<leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>")
nmap("<leader>2", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>")
nmap("<leader>3", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>")
nmap("<leader>4", "<cmd>lua require('harpoon.ui').nav_file(4)<CR>")

-- only set when an lsp is attached
vim.api.nvim_create_autocmd({"LspAttach"}, {
  pattern = {"*"},
  callback = function()
    nmap("K", vim.lsp.buf.hover)
    nmap("<leader>gd", vim.lsp.buf.definition)
    nmap("<leader>gt", vim.lsp.buf.type_definition)
    nmap("<leader>gi", vim.lsp.buf.implementation)
    nmap("<leader>dj", vim.diagnostic.goto_next)
    nmap("<leader>dk", vim.diagnostic.goto_prev)
    nmap("<leader>R", vim.lsp.buf.rename)
    nmap("<leader>a", vim.lsp.buf.code_action)
  end
})

