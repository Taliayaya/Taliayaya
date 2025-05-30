" ~/.vimrc

" set the runtime path to include Vundle and initialize
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" echo ">^.^<"


" All of your Plugins must be added before the following line
" To ignore plugin indent changes, instead use:
"filetype plugin on

set wrap
set number
set cc=80
set tabstop=4
set shiftwidth=4
set expandtab


let mapleader = ","
let maplocalleader = "\\"
" per .git vim configs
" just `git config vim.settings "expandtab sw=4 sts=4"` in a git repository
" change syntax settings for this repository

augroup create_working_env
    " autocmd BufNewFile *_.c,*_.c 0r ~/.vim/skeleton_test.c
    autocmd BufNewFile *.c  0r ~/.vim/skeleton.c
    autocmd BufNewFile *.h  0r ~/.vim/skeleton.h
    autocmd BufNewFile *.s  0r ~/.vim/skeleton.s
    autocmd BufNewFile *.[ch] ks|call SetCopyright()|'s
augroup END

augroup file_keybinds
    autocmd FileType c nnoremap <buffer> <localleader>c I//<esc>
    autocmd FileType c iabbrev <buffer> iff if ()<left>
    autocmd FileType sh,bash nnoremap <buffer> <localleader>c I# <esc>
augroup END

fun SetCopyright()
    if line("$") > 40
        let l = 40
    else
        let l = line("$")
    endif
    silent! exe "1," . l . "g/date: /s/date: .*/date:    " . strftime("%Y %b %d")
    let filename = expand('%:t:r')
    let defkey = toupper(filename)
    if expand('%:e') == "h"
        exe "1," . l . 's/<header>/' . defkey . '/'
    endif

    silent! exe "1," . l . 's/<file>/' . expand('%:t') . '/'
    silent! exe "1," . l . 's/<filename>/' . filename . '/'
endfun

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" https://github.com/tpope/vim-sensible
Plugin 'tpope/vim-sensible'

" https://github.com/ycm-core/YouCompleteMe
Plugin 'ycm-core/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

runtime! plugin/sensible.vim

set encoding=utf-8 fileencodings=
let g:ycm_enable_inlay_hints=1
syntax on

autocmd Filetype make setlocal noexpandtab

set list listchars=tab:»·,trail:·


" per .git vim configs
" just `git config vim.settings "expandtab sw=4 sts=4"` in a git repository
" change syntax settings for this repository
let git_settings = system("git config --get vim.settings")
if strlen(git_settings)
        exe "set" git_settings
endif

Plugin 'rhysd/vim-clang-format'

" ===== KEYBINDS =====

nnoremap gb :ls<CR>:b<Space>
inoremap <leader>u <esc>ebveUea
inoremap jk <esc> " Replace here to change your own Escape keybind
inoremap <esc> <nop>
nnoremap <s-Q> <nop>

nnoremap <leader>u ebveUe

nnoremap <leader>ev :vs $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <silent> <localleader>h <Plug>(YCMToggleInlayHints)

" imap <c-u> <esc>vwU<esc>i
iab #i #include
iab #d #define
iab io. <stdio.h>
iab main int main(void)<cr>{<cr>return 0;<cr>}
iab mainn int main(int argc, char **argv)<cr>{<cr>if (argc != 2) return 1; <cr>return 0;<cr>}
iab #t #include <criterion/criterion.h><cr>#include <criterion/new/assert.h><cr><cr>TestSuite(

iab stuct struct
iab sutrc struct
iab sturct struct
