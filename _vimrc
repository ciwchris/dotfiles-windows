" Preamble ---------------------------------------------------------------- {{{
set nocompatible


" Not neccessary with Vundle
"call pathogen#infect() " Use Pathogen for plugins
"filetype plugin on
"
" }}}

" Basic Options ----------------------------------------------------------- {{{
set encoding=utf-8

" Change font
set guifont=Hack:h11

" Turn off toolbar
set guioptions-=T
set guioptions-=m
" Use clipboard when maipulating text in visual mode
set guioptions+=a
set guioptions+=A
" Remove scrollbars
set guioptions-=r
set guioptions-=R
set guioptions-=b
set guioptions-=l
set guioptions-=L

" Clear all autocmds so they won't get loaded twice
autocmd!

set backspace=indent,eol,start

set history=1000        " keep 1000 lines of command line history
set showcmd             " display incomplete commands
set incsearch           " do incremental searching
set hlsearch
set tabstop=4
set shiftwidth=4        " 4 characters for indenting
set expandtab           " tabs to spaces

set relativenumber      " relative line numbers to the current line
set number              " combined with the above only make current line the absolute number

set mouse=a             " use mouse in xterm to scroll
set scrolloff=5         " 5 lines bevore and after the current line when scrolling
set ignorecase          " ignore case
set smartcase           " but don't ignore it, when search string contains uppercase letters
set hid                 " allow switching buffers, which have unsaved changes
set showmatch           " showmatch: Show the matching bracket for the last ')'?

"set cindent                " set autoindent
set smartindent

set textwidth=0
set nowrap              " don't wrap by default
syn on
set completeopt=menu,longest,preview
set wildmode=list:longest,full  " tab complete to longest string
set confirm

"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" Set up Vim for using PowerShell as the shell
" Unfortunately this breaks shell commands like :% !xmllint.exe
"set shell=powershell
"set shellcmdflag=-command

" use one color scheme for regular use and another for diffs
if &diff
    " set t_Co=256
    " set backgroud=dark
    " colorscheme slate
    set diffopt=filler
    set diffopt+=iwhite
    set diffopt+=icase
    set scrollbind
endif

set background=dark
colorscheme solarized

set runtimepath+=$USERPROFILE/vimfiles

" bookmarks
" not using anymore
"let g:showmarks_enable=0

" viminfo to turn off saving global marks across sessions
" set viminfo='100,f0

" do not use swap or backup files
"set nobackup
"set nowritebackup
"set noswapfile

" try out using backup and swap files but writing them all here
set backupdir=~/vimtmpdir,.
set directory=~/vimtmpdir,.

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"
let g:mapleader = "\<Space>"

au GUIEnter * simalt ~x
" change to directory of current file automatically
autocmd! BufEnter,BufRead,BufNewFile,BufFilePost *  execute ":lcd " . expand("%:p:h")

""""" XML Folding
"let g:xml_syntax_folding=1
au FileType xml,xsd setlocal foldmethod=syntax

" turn on folding using markers
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

augroup filetype_csharp
    autocmd!
    autocmd FileType cs setlocal foldmethod=syntax
augroup END

augroup filetype_javascript
    autocmd!
    autocmd FileType javascript setlocal foldmethod=syntax
""    autocmd FileType javascript setlocal foldmethod=marker
""    autocmd FileType javascript setlocal foldmarker=#region,#endregion
augroup END

" make sure md files are treated as markdown
augroup filetypedetect
    autocmd BufNew,BufNewFile,BufRead *.md set filetype=markdown
augroup END



"
" }}}

" Bundles ----------------------------------------------------------- {{{

filetype off                            " required by Vundle

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'mileszs/ack.vim'
"Bundle 'SirVer/ultisnips'
Bundle 'tpope/vim-dispatch'
" Bundle 'Valloric/YouCompleteMe'
Bundle "OrangeT/vim-csharp"
"Bundle 'nosami/Omnisharp'

Bundle 'scrooloose/syntastic'

Bundle 'sjl/splice.vim'
" Bundle 'lunaru/vim-less' " syntax for less files
Bundle 'vim-scripts/mru.vim'
" snippets
"Bundle 'msanders/snipmate.vim'
" change quoting/parens/brackets: cs\"', ds\", ysiw[, ysiw], S<myTag>
Bundle 'tpope/vim-surround'
" :Subvert/a {one,two}/an {o,t}/g, coerce: crs, crm, crc, cru,  :Abolish {despa,sepe}rat{e,es,ed,ing,ely,ion,ions,or}  {despe,sepa}rat{}
" Bundle 'tpope/vim-abolish'
" repeats plugin mappings
" Bundle 'tpope/vim-repeat'
" commenting: #gcc, gc(motion)
Bundle 'tpope/vim-commentary'
" Bundle 'tpope/vim-speeddating' " increment decrement dates, times, etc
" line up on commas :Tabularize /,
" Bundle 'vim-scripts/Tabular'
Bundle 'vim-scripts/bufexplorer.zip'
" The actual vim-scripts repo is messed up (which is just a mirror from google code)
" Bundle 'tom-dignan/Conque-Shell'
Bundle 'altercation/vim-colors-solarized'
Bundle 'takac/vim-fontmanager'
Bundle 'itchyny/lightline.vim'

" Bundle 'krisajenkins/vim-pipe'
" Bundle 'chrisbra/unicode.vim'


"Bundle 'vim-scripts/ctrlp.vim'
Bundle 'Shougo/unite.vim'
" Have to copy in lua51.dll into the same directory gvim is located. Has to be lua51, or whatever referenced when compiled. :version
Bundle 'Shougo/neocomplete.vim'
Bundle 'Shougo/neosnippet'
Bundle 'ciwchris/neosnippet-snippets'
" fugitive does not play well with splice
"Bundle 'tpope/vim-fugitive'
"Bundle 'gregsexton/gitv'
"Bundle 'vim-scripts/BufOnly.vim'
"Bundle 'vim-scripts/ZoomWin'

" Database
Bundle 'vim-scripts/dbext.vim'
Bundle 'vim-scripts/SQLComplete.vim'


filetype plugin indent on               " required
"
"" }}}

" Plugin Settings ----------------------------------------------------------- {{{

" FontManager settings {{{
let g:fontman_font = "Hack"
let g:fontman_size = 11


let MRU_Max_Entries = 100

" Use long listing when browsing directories
let g:netrw_liststyle= 1

" let g:ConqueTerm_EscKey = '<c-d>'
" Start up powershell within vim
":nnoremap <Leader>sp :ConqueTermSplit powershell<CR>
" }}}

" lightline {{{
set laststatus=2 " always show
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': { 'left': [['filename','modified']], 'right': [['column']]},
      \ 'inactive': { 'left': [['filename','modified']], 'right': [['column']]}
      \ }
" }}}

" neocomplete {{{
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
"
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-l> neocomplete#complete_common_string()

autocmd FileType css,less,sass setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"}}}

" neosnippet {{{

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" Don't use the default snippets package
"let g:neosnippet#disable_runtime_snippets = {'_' : 1, }
" " Instead use a custom package
" let g:neosnippet#snippets_directory='~/.vim/bundle/snippets'

" imap <C-m>     <Plug>(neosnippet_expand_or_jump)
" smap <C-m>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-m>     <Plug>(neosnippet_expand_target)
"}}}

" syntastic {{{
" disable because its picking up the local xmllint which doesn't work with must xml file types
let g:syntastic_xml_checkers=['']
"}}}
"
" dbext {{{
" Each buffer has its OWN Result buffer
let g:dbext_default_use_sep_result_buffer = 1

let g:dbext_default_profile_sandbox  = 'type=SQLSRV:integratedlogin=1:srvname=sqlbcpphoenixtest,14338:dbname=sandbox'
let g:dbext_default_profile_staging3  = 'type=SQLSRV:integratedlogin=1:srvname=sqlbcpphoenixtest,14338:dbname=staging3'
let g:dbext_default_profile_staging6  = 'type=SQLSRV:integratedlogin=1:srvname=sqlbcpphoenixtest,14338:dbname=staging6'
let g:dbext_default_profile_membership  = 'type=SQLSRV:integratedlogin=1:srvname=sqlbcpappytest,14346:dbname=membership'
let g:dbext_default_profile_membership_test  = 'type=SQLSRV:integratedlogin=1:srvname=sqlbcpappytest,14345:dbname=membership'
let g:dbext_default_profile_toolkit  = 'type=SQLSRV:integratedlogin=1:srvname=sqlbcpphoenixtest,14338:dbname=toolkitdev'
let g:dbext_default_profile_validation  = 'type=SQLSRV:integratedlogin=1:srvname=sqlbcpappytest,14346:dbname=validation'
let g:dbext_default_profile_validation_test  = 'type=SQLSRV:integratedlogin=1:srvname=sqlbcpappytest,14345:dbname=validation'
let g:dbext_default_profile_nexus  = 'type=SQLSRV:integratedlogin=1:srvname=sqlbcpappytest,14346:dbname=nexus'
let g:dbext_default_profile_nexus_test  = 'type=SQLSRV:integratedlogin=1:srvname=sqlbcpappytest,14345:dbname=nexus'

" }}}

" }}}

" Mappings ---------------------------------------------------------------- {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>:set wrap<cr>

:command! SortCSS :s/\([{;]\)\s*/\1\r/g | '[+1,']sort | '[,']join
:nnoremap <leader>scss :SortCSS<cr>

:command! SortCSSBraceContents :g#\({\n\)\@<=#.,/}/sort

"Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" up and down for screen not file line
nnoremap j gj
nnoremap k gk

" Indent xml file
:nmap <F2> :filetype indent on<CR>:%s/>\s*</>\r</g<CR>gg=G<CR>
" set equalprg=xmllint\ --format\ -

" Insert newlines w/o entering insert mode
:nnoremap <A-o> O<Esc><CR>

" Scroll w/o moving cursor
:nnoremap <C-j> <C-E>
:nnoremap <C-k> <C-Y>

" Page down with space bar - space now the loader
" :noremap <space> <C-f>

:nnoremap daB diBdap

" Quickly unload(delete) a buffer
:nnoremap <leader>d :bd!<CR>
"
" Quickly write a buffer
:nnoremap <leader>w :w<CR>

" Fast switching to previous buffer
nnoremap <leader>bp :b#<cr>

" Jump to last position
:nnoremap <leader>lp ``

" Copy & paster system clipboard
vmap <leader>y "*y
vmap <leader>d "*d
nmap <leader>p "*p
nmap <leader>P "*P
vmap <leader>p "*p
vmap <leader>P "*P

""""""" show chars for tab and end of line
set list
set listchars=tab:▸\ ,eol:¬
""" comment out spaces for now ,space:⋅

" Open up todos
":nmap <Leader>td :e d:\Action\todo.txt<CR>

" remove search highlighting with escape
:nnoremap <esc> :noh<return><esc>


 let $PATH = $PATH . ';C:\Program Files (x86)\Microsoft Visual Studio 9.0\Common7\IDE\;C:\WINDOWS\Microsoft.NET\Framework\v2.0.50727;C:\D\Programs\Pdf\;C:\D\Projects\Phoenix\Service'
:nnoremap <Leader>i :update<CR>:silent !start c:\Program Files\Internet Explorer\iexplore.exe file://%:p<CR>
:nnoremap <Leader>f :update<CR>:silent !start c:\Program Files (x86)\Mozilla Firefox\firefox.exe file://%:p<CR>
:nnoremap <Leader>v :update<CR>:silent !start c:\windows\system32\wscript.exe "%:p"<CR>
" :nnoremap <Leader>p :update<CR>:silent !start powershell.exe -noexit -file "%:p"<CR>

" UtilSnips with YouCompleteMe
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" copy working directory of current buffer
" :nmap ,p :let @p=substitute(expand("%:p:h"), "/", "\\", "g")<CR>
"
"}}}

" Highlight word {{{
highlight InterestingWord1 guibg=green guifg=white
highlight InterestingWord2 guibg=blue guifg=white
highlight InterestingWord3 guibg=pink guifg=black

nnoremap <silent> <leader>he :execute 'match ErrorMsg /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> <leader>hh :execute 'match InterestingWord1 /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> <leader>h1 :execute 'match InterestingWord1 /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> <leader>h2 :execute '2match InterestingWord2 /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> <leader>h3 :execute '3match InterestingWord3 /\<<c-r><c-w>\>/'<cr>
nnoremap <leader>hc :match none<cr>:2match none<cr>:3match none<cr>

" I often use one word form accidentally in place of another.
" This will highlight these occurrences so I can review them
iabbrev there there<esc>b<leader>heea
iabbrev their their<esc>b<leader>heea
iabbrev attend attend<esc>b<leader>heea
iabbrev our our<esc>b<leader>heea
iabbrev from from<esc>b<leader>heea
iabbrev form form<esc>b<leader>heea
" }}}

" Commands ---------------------------------------------------------------- {{{

"command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline, ...)
  let isfirst = 1
  let words = []
  for word in split(a:cmdline)
    if isfirst
      let isfirst = 0  " don't change first word (shell command)
    else
      if word[0] =~ '\v[%#<]'
        let word = expand(word)
      endif
      if word[0] != '/'
          let word = shellescape(word, 1)
      endif
    endif
    call add(words, word)
  endfor
  let expanded_cmdline = a:0 > 0 ? join(words).a:1 : join(words)
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile wrap
  "call setline(1, 'You entered:  ' . a:cmdline)
  "call setline(2, 'Expanded to:  ' . expanded_cmdline)
  call append(line('$'), substitute(getline(2), '.', '=', 'g'))
  silent execute '$read !'. expanded_cmdline
  1
endfunction

command! -complete=file -nargs=* PhoenixCommand call s:RunShellCommand('PhoenixService '.<q-args>)
nmap <Leader>pp :PhoenixCommand %<CR>

command! -complete=file -nargs=1 PhoenixSearch call s:RunShellCommand('findstr /s /i /n '.<q-args>, ' C:\D\Projects\STCU\STCU\STCU.Phoenix\Schema\*.xsd')
nmap <Leader>ps :PhoenixSearch 

command! -complete=file -nargs=* ExecutePowershell call s:RunShellCommand('powershell -file '.<q-args>)
nmap <Leader>pb :ExecutePowershell  %:p<CR>

command! -complete=file -nargs=1 RunJavaScript call s:RunShellCommand('cscript /Nologo '.<q-args>)
nmap <Leader>j :RunJavaScript %:p<CR>

"}}}
