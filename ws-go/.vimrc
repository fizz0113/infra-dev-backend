" ===========================
" 基本設定
" ===========================
set nocompatible
set number
set cursorline
set tabstop=4
set shiftwidth=4
set expandtab
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp950,gb2312
set termencoding=utf-8

filetype plugin indent on
syntax enable

" ===========================
" vim-plug 插件管理
" ===========================
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
call plug#end()

" ===========================
" gopls 自動補全 + 格式化
" ===========================
let g:coc_global_extensions = ['coc-go']
autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd BufWritePre *.go call CocAction('runCommand', 'editor.action.organizeImport') | call CocAction('format')
autocmd BufWritePost *.go :redraw!


" ===========================
" 快捷鍵 (類 VSCode)
" ===========================
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap K :call CocActionAsync('doHover')<CR>
inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<TAB>"


