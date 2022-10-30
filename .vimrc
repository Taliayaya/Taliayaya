"##  My vimrc

"# UTF-8 
set encoding=utf-8

"# Indentation

set autoindent
set shiftwidth=3
syntax enable
set wrap
set tabstop=4

"foldinnnnnnnng
augroup vimrc
	au BufReadPre * setlocal foldmethod=indent
	au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif

"# Interface 

set wildmenu
set wildmode=full
" For beautiful numbers on the left~~
set relativenumber 
set number

"# Protect me
set confirm 

"# File Tree
" To manage & open file efficently !

" Open files in a new vertical split (2)
" new tab (3)
let g:netrw_browse_split=2

" Set width of the directory explorer (%)
let g:netrw_winsize=90

" Enable Omnicomplete features
set omnifunc=syntaxcomplete#Complete



" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
" ## added by OPAM user-setup for vim / ocp-indent ## 251a4c470cec0c5f0e8996975b23949b ## you can edit, but keep this line
if count(s:opam_available_tools,"ocp-indent") == 0
  source "/home/taliayayah/.opam/default/share/ocp-indent/vim/indent/ocaml.vim"
endif
" ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line
