--LATEX
--for this to work, you need to install mactex
vim.g.tex_flavor = "latex"
vim.g.tex_conceal = ""
vim.g.vimtex_fold_manual = 1
vim.g.vimtex_compiler_projname = "nvr"
-- newly added for minted package
vim.cmd("let g:vimtex_compiler_latexmk = { 'continuous': 1, 'options' : [ '-shell-escape' ] }")

-- old vim code
-- "LATEX for this to work you need to install mactex
-- let g:tex_flavor  = 'latex'
-- let g:tex_conceal = ''
-- let g:vimtex_fold_manual = 1
-- "let g:vimtex_latexmk_continuous = 1
-- let g:vimtex_compiler_projname = 'nvr'
-- " newly added for minted package
-- let g:vimtex_compiler_latexmk = {
--       \'continuous' : 1,
--       \'options' : [
--         \'-shell-escape',
--         \],
--         \}
