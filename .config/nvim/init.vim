" dein settings {{{
if &compatible
  set nocompatible
endif
" dein.vimのディレクトリ
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" なければgit clone
if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " 管理するプラグインを記述したファイル
  call dein#load_toml("~/.config/nvim/.dein.toml", {'lazy': 0})
  call dein#load_toml("~/.config/nvim/.dein_lazy.toml", {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif
" プラグインの追加・削除やtomlファイルの設定を変更した後は
" 適宜 call dein#update や call dein#clear_state を呼んでください。
" そもそもキャッシュしなくて良いならload_state/save_stateを呼ばないようにしてください。

" 2016.04.16 追記
" load_cache -> load_state
" save_cache -> save_state
" となり書き方が少し変わりました。
" 追記終わり

if dein#check_install()
  call dein#install()
endif
" }}}

"""nerdtree setting{{{
	let g:NERDTreeShowBookmarks=1
	autocmd StdinReadPre * let s:std_in=1
	autocmd vimenter * if argc() == 0 && !exists("s:std_in") |NERDTree|endif
"""}}}



"neovim本体設定
set number
set termguicolors
set mouse=a
"set cursorline
set tabstop=2
set shiftwidth=2
set ambiwidth=double
set wrap
set smartindent
set virtualedit=onemore



colorscheme molokai
syntax on
setlocal cursorline
set t_Co=256
set background=dark

"キー設定
nnoremap <C-t> :Tnew<CR><C-w>ji
tnoremap <silent> <ESC> <C-\><C-n>
nnoremap ; :
nnoremap <silent> <C-n> :NERDTreeToggle<CR>


"自動補完系


"neoterm設定
let g:neoterm_position = 'horizontal'
" Useful maps
" hide/close terminal
nnoremap <silent> ,th :call neoterm#close()<cr>
" clear terminal
nnoremap <silent> ,tl :call neoterm#clear()<cr>
" kills the current job (send a <c-c>)
nnoremap <silent> ,tc :call neoterm#kill()<cr>

" Git commands
command! -nargs=+ Tg :T git <args>

"lightline設定
let g:lightline = {
  \'active': {
  \  'left': [
  \    ['mode', 'paste'],
  \    ['readonly', 'filename', 'modified', 'ale'],
  \  ]
  \},
\ }




" The NERD Tree設定
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
