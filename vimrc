set nu
set clipboard=unnamed
set fileencoding=utf-8
set fileencodings=utf-8,sjis,iso-2022-jp,euc-jp
" change encoding sample ':e ++enc=euc-jp'
set laststatus=2
set statusline=[%n]\ %t\ %y%{GetStatusEx()}%m%r%=%l,%c%V\ \ \ \ %P
set comments=
set tabstop=4
set noautoindent
" until v7.4.785 you have to use ':set bin noeol' before cloging
" set nofixeol
autocmd FileType * set formatoptions-=ro
 
" show encoding
function! GetStatusEx()
  let str = &fileformat
    if has("multi_byte") && &fileencoding != ""
        let str = &fileencoding . ":" . str
    endif
    let str = "[" . str . "]"
    return str
endfunction
 
augroup BinaryXXD
  autocmd!
  autocmd BufReadPre  *.bin let &binary =1
  autocmd BufReadPost * if &binary | silent %!xxd -g 1
  autocmd BufReadPost * set ft=xxd | endif
  autocmd BufWritePre * if &binary | %!xxd -r | endif
  autocmd BufWritePost * if &binary | silent %!xxd -g 1
  autocmd BufWritePost * set nomod | endif
augroup END

set mouse=a

" enable clipboard for macOS
set clipboard=unnamed,autoselect

" color
syntax enable
set background=dark
let g:solarized_termcolors=256

" cursor move to next line with left/right
set whichwrap=b,s,h,l,<,>,[,],~

" beep off
" set belloff=all
noremap <C-\[> <esc>
noremap! <C-\[> <esc>
inoremap ;; <esc>

