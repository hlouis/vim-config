" -----------------------------------------------------------------------------  
" |                            VIM Settings                                   |
" |                   (see gvimrc for gui vim settings)                       |
" -----------------------------------------------------------------------------  
 
set nocompatible
" set list	" display can't see characters
" set fileformat?	" display file format for CR, LF

" History ********************************************************************
set history=50
 
" Tabs ***********************************************************************
set softtabstop=4
set shiftwidth=4
set tabstop=4
set noexpandtab
set sta " a <Tab> in an indent inserts 'shiftwidth' spaces
 
set path=.,/usr/include,../include,,
 
" Indenting ********************************************************************
set ai " Automatically set the indent of a new line (local to buffer)
set si " smartindent  (local to buffer)
 
 
" Scrollbars ******************************************************************
set sidescrolloff=2
set numberwidth=4
 
 
" Windows *********************************************************************
set equalalways " Multiple windows, when created, are equal in size
set splitbelow splitright
 
"Vertical split then hop to new buffer
:noremap ,v :vsp^M^W^W<cr>
:noremap ,h :split^M^W^W<cr>
 
 
" Cursor highlights ***********************************************************
set cursorline
"set cursorcolumn
 
 
" Searching *******************************************************************
set hlsearch  " highlight search
set incsearch  " incremental search, search as you type
set ignorecase " Ignore case when searching 
set smartcase " Ignore case when searching lowercase
" Remove search hightlight
map <F2> :nohlsearch<cr>
map! <F2> <Esc>:nohlsearch<cr>i
 
 
" Colors **********************************************************************
"set t_Co=256 " 256 colors
set background=dark 
syntax on " syntax highlighting
" colorscheme ir_black
colorscheme desert 
 
 
" Status Line *****************************************************************
set showcmd
set ruler " Show ruler
"set ch=2 " Make command line two lines high
 
 
" Line Wrapping ***************************************************************
"set nowrap
set linebreak  " Wrap at word
 
 
" Mappings ********************************************************************
" Professor VIM says '87% of users prefer jj over esc', jj abrams strongly disagrees
imap jj <Esc>
"imap uu _
"imap hh =>
"imap aa @
 
 
" Directories *****************************************************************
" Setup backup location and enable
"set backupdir=~/backup/vim
"set backup
 
" Set Swap directory
"set directory=~/backup/vim/swap
 
" Sets path to directory buffer was loaded from
"autocmd BufEnter * lcd %:p:h

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\   exe "normal! g`\"" |
	\ endif
 
" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
                 \ | wincmd p | diffthis
 
" File Stuff ******************************************************************
filetype plugin indent on
" To show current filetype use: set filetype
autocmd FileType html :set filetype=xhtml " we couldn't care less about html
 
 
" Inser New Line **************************************************************
map <S-Enter> O<ESC> " awesome, inserts new line without going into insert mode
map <C-Enter> o<ESC>
"set fo-=r " do not insert a comment leader after an enter, (no work, fix!!)
 
 
" Sessions ********************************************************************
" Sets what is saved when you save a session
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize
 
 
" Misc ************************************************************************
set backspace=indent,eol,start
set number " Show line numbers
set matchpairs+=<:>
set vb t_vb= " Turn off the bell, this could be more annoying, but I'm not sure how
 
" Set list Chars - for showing characters that are not
" normally displayed i.e. whitespace, tabs, EOL
"set listchars=trail:.,tab:>-,eol:$
"set nolist
 
 
" Mouse ***********************************************************************
set mouse=a " Enable the mouse
behave xterm
set selectmode=mouse
 
 
" Cursor Movement *************************************************************
" Make cursor move by visual lines instead of file lines (when wrapping)
"map <up> gk
"imap <up> <C-o>gk
"map <down> gj
"imap <down> <C-o>gj
"map E ge
"map k gk
"map j gj
 
 
" Nav though windows *********************************************************
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l
map <C-C> <C-W>c
 
" Encodings ******************************************************************
" Set utf-8 is the default encoding
set fileencoding=utf-8
set fileencodings=utf-8,gbk,gb2312,latin1,default

" Quick Fix window ***********************************************************
map <C-N> :cn<cr>
map <C-P> :cp<cr>

" Some iabs ******************************************************************
" set my signature
iab  sign  <c-r>="Louis @ " . strftime("%a %d %b %Y")
 
" switch tabs by tab and numbers *********************************************
map <A-1> :tabnext 1<cr>
map <A-2> :tabnext 2<cr>
map <A-3> :tabnext 3<cr>
map <A-4> :tabnext 4<cr>
map <A-5> :tabnext 5<cr>
map <A-6> :tabnext 6<cr>
map <A-7> :tabnext 7<cr>
map <A-8> :tabnext 8<cr>
map <A-9> :tabnext 9<cr>
map! <A-1> <Esc>:tabnext 1<cr>
map! <A-2> <Esc>:tabnext 2<cr>
map! <A-3> <Esc>:tabnext 3<cr>
map! <A-4> <Esc>:tabnext 4<cr>
map! <A-5> <Esc>:tabnext 5<cr>
map! <A-6> <Esc>:tabnext 6<cr>
map! <A-7> <Esc>:tabnext 7<cr>
map! <A-8> <Esc>:tabnext 8<cr>
map! <A-9> <Esc>:tabnext 9<cr>

" Cscope options **************************************************************
" See ~/.vim/plugin/cscope_macros.vim for detail
set cscopequickfix=s-,c-,d-,i-,t-,e-

" -----------------------------------------------------------------------------  
" |                              Pluggins                                     |
" -----------------------------------------------------------------------------  

" Omni Completion *************************************************************
"autocmd FileType html :set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType c set omnifunc=ccomplete#Complete
" 
 
" EnhancedCommentify **********************************************************
let g:EnhCommentifyRespectIndent = 'Yes'	
let g:EnhCommentifyPretty = 'Yes'

" NERDTree ********************************************************************
let g:NERDTreeIgnore=['\.vim$', '\~$', '\.o$', 'tags', 'cscope\.']
let g:NERDTreeWinPos="left"
nnoremap <silent> <F5> :NERDTreeToggle<CR>

" Tag List ********************************************************************
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window = 1
nnoremap <silent> <F6> :TlistToggle<CR>

" SnippetsEmu *****************************************************************
"imap <unique> <C-j> <Plug>Jumper
"let g:snip_start_tag = "_\."
"let g:snip_end_tag = "\._"
"let g:snip_elem_delim = ":"
"let g:snip_set_textmate_cp = '1'  " Tab to expand snippets, not automatically.
 
 
" fuzzyfinder_textmate *****************************************************************
"map ,f :FuzzyFinderTextMate<CR>
"map ,b :FuzzyFinderBuffer<CR>
"let g:fuzzy_ignore = '.o;.obj;.bak;.exe;.pyc;.pyo;.DS_Store;.db'
 
" Fuzzyfinder *****************************************************************
" Fuzzy finder rocks, like Command-T in TextMate (buggy at moment, fix!!)
let g:FuzzyFinderOptions = { 'Base':{}, 'Buffer':{}, 'File':{}, 'MruFile':{}, 'Dir':{}, 'Tag':{}, 'TaggedFile':{}}
let g:FuzzyFinderOptions.Base.ignore_case = 1
let g:FuzzyFinderOptions.Base.abbrev_map = { "^Project-" : ["**/"], }
let g:FuzzyFinderOptions.Base.migemo_support = 0
let g:FuzzyFinderOptions.File.excluded_path = '\v\~$|\.o$|\.git/|\.DS_Store|\.exe$|\.bak$|\.swp$|((^|[/\\])\.[/\\]$)'
map ,f :FuzzyFinderFile<CR>
map ,b :FuzzyFinderBuffer<CR>
map ,t :FuzzyFinderTag!<CR>
map ,m :FuzzyFinderMruFile!<CR>
 
 
" autocomplpop ***************************************************************
" complete option
"set complete=.,w,b,u,t,k
"let g:AutoComplPop_CompleteOption = '.,w,b,u,t,k'
"set complete=.
let g:AutoComplPop_IgnoreCaseOption = 1
let g:AutoComplPop_BehaviorKeywordLength = 2
 
" a.vim **********************************************************************
let g:alternateSearchPath = 'sfr:../source,sfr:../src,sfr:../include,sfr:../inc,sfr:../../head/core'

" minibufexpl ****************************************************************
let g:miniBufExplSplitBelow = 0 " mini buf window will apear above.
let g:miniBufExplMapCTabSwitchBufs = 1 " use C-Tab and C-S-Tab to switch bufs.
let g:miniBufExplModSelTarget = 1 " Don't put buf in nonmodifiable window.
let g:miniBufExplMinSize = 1 " at least display 1 line.
let g:miniBufExplMaxSize = 2 " max display 2 line.
 
" -----------------------------------------------------------------------------  
" |                             OS Specific                                   |
" |                      (GUI stuff goes in gvimrc)                           |
" -----------------------------------------------------------------------------  
 
" Mac *************************************************************************
"if has("mac") 
  "" 
"endif
 
" Windows *********************************************************************
"if has("gui_win32")
  "" 
"endif
 
