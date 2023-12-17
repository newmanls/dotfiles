let g:vimtex_imaps_enabled = 0
let g:vimtex_syntax_enabled = 0
let g:vimtex_toc_config = {
    \ 'layer_status': { 'label': 0, 'include': 0 },
    \ 'show_help': 0,
    \ }
let g:vimtex_compiler_latexmk = {
    \ 'aux_dir' : '.aux',
    \ 'out_dir' : '',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'hooks' : [],
    \ 'options' : [
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=0',
    \   '-interaction=nonstopmode',
    \ ],
    \ }
