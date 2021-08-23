scriptencoding utf-8

if has('vim_starting') " Changing encoding in Vim at runtime is undefined behavior.
  set fileencodings=utf-8,sjis,cp932,euc-jp
  set fileformats=unix,mac,dos
endif

" setting vim-plug
call plug#begin('~/.vim/plugged')
" coler schemes
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim'
Plug 'w0ng/vim-hybrid'
Plug 'cocopon/iceberg.vim'
Plug 'ghifarit53/tokyonight-vim'
Plug 'whatyouhide/vim-gotham'
Plug 'sainnhe/forest-night'
Plug 'aereal/vim-colors-japanesque'
" statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" git
Plug 'lambdalisue/gina.vim'
Plug 'tpope/vim-fugitive'
" シンタックスハイライト
Plug 'sheerun/vim-polyglot'
" インクリメンタルサーチ
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" テキストオブジェクト
Plug 'easymotion/vim-easymotion'
" インターフェース改善
Plug 'itchyny/vim-cursorword'
" url見やすくする
Plug 'tyru/open-browser.vim'
" ファイラ
Plug 'cocopon/vaffle.vim'
" カラースキーム
Plug 'morhetz/gruvbox'
" Lsp関連のプラグイン
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/async.vim'
" vim-go
" Plug 'fatih/vim-go', { 'do' : ':GoUpdateBinaries'}
" vim-delve
Plug 'sebdah/vim-delve'
" md
Plug 'skanehira/preview-markdown.vim'
"fern-settings
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'lambdalisue/fern-hijack.vim'
Plug 'LumaKernel/fern-mapping-fzf.vim'
Plug 'ryanoasis/vim-devicons'
" sl
call plug#end()

" setting vim
if !has('nvim')
  set backspace=indent,eol,start
endif

syntax enable
filetype plugin indent on

set hlsearch
set number
set autoindent
set smartindent
" インクリメンタルサーチ
set incsearch
set nobackup
set noswapfile
set clipboard+=unnamedplus

if has('mouse')
  set mouse=a
endif

if &t_Co != 256
  set t_Co=256
endif

"" Tab config "" 
inoremap <expr><CR> pumvisible() ? "<C-y>" : "<CR>"
inoremap <expr><Tab> pumvisible() ? "\<C-n>" : MyInsCompl()
function! MyInsCompl() abort
  let c = nr2char(getchar())
  if c == "l"
    return "\<C-x>\<C-l>"
  elseif c == "n"
    return "\<C-x>\<C-n>"
  elseif c == "p"
    return "\<C-x>\<C-p>"
  elseif c == "k"
    return "\<C-x>\<C-k>"
  elseif c == "t"
    return "\<C-x>\<C-t>"
  elseif c == "i"
    return "\<C-x>\<C-i>"
  elseif c == "]"
    return "\<C-x>\<C-]>"
  elseif c == "f"
    return "\<C-x>\<C-f>"
  elseif c == "d"
    return "\<C-x>\<C-d>"
  elseif c == "v"
    return "\<C-x>\<C-v>"
  elseif c == "u"
    return "\<C-x>\<C-u>"
  elseif c == "o"
    return "\<C-x>\<C-o>"
  elseif c == "s"
    return "\<C-x>s"
  endif
  return "\<Tab>"
endfunction

" ファイルタイプごとにインデントを設定
augroup MyFileTypeIndentOverRide
  autocmd!
  autocmd FileType py setlocal tabstop=4 softtabstop=4 shiftwidth=4
  autocmd FileType rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd FileType vim setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd FileType eruby setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

"スペースをトリガーにする
let mapleader = "\<Space>"

" vimのキーバインド設定
nnoremap <ESC><ESC> :nohlsearch<CR>
nnoremap j gj
nnoremap k gk
nnoremap <Leader>t :terminal<CR>
nnoremap <Leader>v :vsplit<CR>
nnoremap <Leader>s :split<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>g :GFiles<CR>
nnoremap <Leader>ld :LspDefinition<CR>
nnoremap <Leader>ne :LspNextError<CR>
nnoremap <Leader>pe :LspPreviosError<CR>
nnoremap <Leader>gina :Gina 
"" Map for go
nnoremap godef :GoDef<CR>
nnoremap gocc :GoDebugContinue<CR>
nnoremap gonn :GoDebugNext<CR>
nnoremap gobreak :GoDebugBreakpoint<CR>
nnoremap gostart :GoDebugStart 
nnoremap goin :GoDebugStep<CR>
nnoremap gopp :GoDebugPrint 
nnoremap goset :GoDebugSet 
nnoremap goout :GoDebugStepOut<CR>
nnoremap gostop :GoDebugStop<CR>
nnoremap goattach :GoDebugAttach 
nnoremap gofill :GoFillStruct<CR>
"" move Tab
nnoremap bn :bn<CR>
nnoremap bd :bd
nnoremap bp :bp<CR>
"" Read vimrc
nnoremap vimrc :source ~/.vim/vimrc<CR>

if has('terminal')
  tnoremap <silent><C-u> <C-\><C-N>
endif

" Insertmode keybinds 
inoremap <C-j> <C-o>gj
inoremap <C-k> <C-o>gk
inoremap <C-h> <Left>
inoremap <C-l> <Right>
"jjでEsc
inoremap <silent> jj <Esc>
inoremap <silent> っｊ <Esc>
inoremap <silent> ｊｊ <Esc>

" インデントを一括で行う
function s:Indent()
  let save_cursor = getcurpos()
  execute "normal " . "gg=G"
  call setpos('.', save_cursor)
endfunction

" インデントコマンドを定義
command -nargs=0 Indent call s:Indent()

" setting vim-airline
set ttimeoutlen=10
let g:airline_extensions = ['branch', 'fzf', 'tabline']
let g:airline_section_c = '%t'

" setting vim-lsp
nnoremap <expr> <silent> <C-]> execute(':LspDefinition') =~ "not supported" ? "\<C-]>" : ":echo<cr>"

" setting open-blowser.vim
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" setting fzf
let g:fzf_layout = { 'window': '10new' }

" setting vaffle
function! RenderMyFavoriteIcon(item) abort
  return WebDevIconsGetFileTypeSymbol(a:item.basename, a:item.is_dir)
endfunction
let g:vaffle_render_custom_icon = 'RenderMyFavoriteIcon'


"右端にもう一文字追加しておく(行末移動)
set virtualedit=onemore

let g:lsp_diagnostics_echo_cursor = 1
function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gr <plug>(lsp-references)
  nmap <buffer> gi <plug>(lsp-implementation)
  nmap <buffer> gt <plug>(lsp-type-definition)
  nmap <buffer> <leader>rn <plug>(lsp-rename)
  nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
  nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
  nmap <buffer> K <plug>(lsp-hover)
endfunction

""
"" Vim-LaTeX
""
filetype plugin on
filetype indent on
set shellslash
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Imap_UsePlaceHolders = 1
let g:Imap_DeleteEmptyPlaceHolders = 1
let g:Imap_StickyPlaceHolders = 0
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='dvi,pdf'
"let g:Tex_FormatDependency_pdf = 'pdf'
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
"let g:Tex_CompileRule_pdf = 'ptex2pdf -u -l -ot "-synctex=1 -interaction=nonstopmode -file-line-error-style" $*'
"let g:Tex_CompileRule_pdf = 'lualatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
let g:Tex_CompileRule_pdf = 'latexmk $*'
"let g:Tex_CompileRule_dvi = 'uplatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
let g:Tex_CompileRule_dvi = 'latexmk $*'
let g:Tex_BibtexFlavor = 'upbibtex'
let g:Tex_MakeIndexFlavor = 'upmendex $*.idx'
let g:Tex_UseEditorSettingInDVIViewer = 1
"let g:Tex_ViewRule_pdf = 'xdg-open'
"let g:Tex_ViewRule_pdf = 'evince'
"let g:Tex_ViewRule_pdf = 'okular --unique'
"let g:Tex_ViewRule_pdf = 'zathura -x "vim --servername synctex -n --remote-silent +\%{line} \%{input}"'
"let g:Tex_ViewRule_pdf = 'qpdfview --unique'
"let g:Tex_ViewRule_pdf = 'texworks'
let g:Tex_ViewRule_pdf = 'mupdf'
"let g:Tex_ViewRule_pdf = 'firefox -new-window'
"let g:Tex_ViewRule_pdf = 'chromium --new-window'

" fern settings
nnoremap <C-n> :Fern . -drawer -reveal=% <CR>
function! s:init_fern() abort
  " Use 'select' instead of 'edit' for default 'open' action
  nmap <buffer> <Plug>(fern-action-open) <Plug>(fern-action-open:select)
endfunction

"fern-settings
augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END

augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

let g:fern#renderer = "nerdfont"

" nerd settings
" guifontを設定しないと文字化けになる。terminalで行ったフォントの設定と同様
" 公式サイトではLinuxとmacOSの設定が若干異なるが、Linuxの設定でもmacOSで問題なし
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12
set encoding=utf-8

" フォルダアイコンを表示
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif

" devicon error escape
set t_RV=
set t_u7=

" Go settings
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

"" gopls golangci-lint-langserver ""
function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> <C-]> <plug>(lsp-definition)
  nmap <buffer> <f2> <plug>(lsp-rename)
  nmap <buffer> <Leader>d <plug>(lsp-type-definition)
  nmap <buffer> <Leader>r <plug>(lsp-references)
  nmap <buffer> <Leader>i <plug>(lsp-implementation)
  inoremap <expr> <cr> pumvisible() ? "\<c-y>\<cr>" : "\<cr>"
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('~/lsp.log')

let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
" let g:asyncomplete_auto_popup = 1
" let g:asyncomplete_auto_completeopt = 0
let g:asyncomplete_popup_delay = 200
let g:lsp_text_edit_enabled = 1
let g:lsp_preview_float = 1
let g:lsp_diagnostics_float_cursor = 1
let g:lsp_settings_filetype_go = ['gopls', 'golangci-lint-langserver']

let g:lsp_settings = {}
let g:lsp_settings['gopls'] = {
      \  'workspace_config': {
        \    'usePlaceholders': v:true,
        \    'analyses': {
          \      'fillstruct': v:true,
          \    },
          \  },
          \  'initialization_options': {
            \    'usePlaceholders': v:true,
            \    'analyses': {
              \      'fillstruct': v:true,
              \    },
              \  },
              \}

" For snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

set completeopt+=menuone

"" go-delve ""
let g:delve_backend = "native"

"" python
set completeopt=menuone                        " 補完候補を呼び出すとき常にポップアップメニューを使う
autocmd! User jedi-vim call s:jedivim_hook()   " vim-plugの遅延ロード呼び出し
function! s:jedivim_hook()              " jedi-vimを使うときだけ呼び出す処理を関数化
  let g:jedi#auto_initialization    = 0 " 自動で実行される初期化処理を無効
  let g:jedi#auto_vim_configuration = 0 " 'completeopt' オプションを上書きしない
  let g:jedi#popup_on_dot           = 0 " ドット(.)を入力したとき自動で補完しない
  let g:jedi#popup_select_first     = 0 " 補完候補の1番目を選択しない
  let g:jedi#show_call_signatures   = 0 " 関数の引数表示を無効(ポップアップのバグを踏んだことがあるため)
  autocmd FileType python setlocal omnifunc=jedi#completions   " 補完エンジンはjediを使う
endfunction

" md
let g:preview_markdown_vertical = 1
" let g:preview_markdown_parser=glow

" color scheme
colorscheme onedark
