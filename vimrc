"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors Fonts and Encodings
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Command mode related
"    -> Moving around, tabs and buffers
"    -> Statusline
"    -> Parenthesis/bracket expanding
"    -> General Abbrevs
"    -> Editing mappings
"
"    -> Cope
"    -> Minibuffer plugin
"    -> Omni complete functions
"    -> Python section
"    -> JavaScript section
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Open pathogen plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
let g:pathogen_disabled = ["snipMate"]
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()


if (has("win32") || has("win64") || has("win32unix"))
    let g:isWin = 1
else
    let g:isWin = 0
endif

function! MySys()
    if (g:isWin)
        return "windows"
	endif

    if has("gui_macvim")
		return "mac"
	endif
    
	return "linux"
    endif
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=300

" Enable filetype plugin
filetype on
filetype plugin on
filetype indent on
set modeline

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Fast editing of the .vimrc
if g:isWin == 1
	map <leader>e :e! ~/vimfiles/vimrc<cr>
else
	map <leader>e :e! ~/.vim/vimrc<cr>
endif

" When vimrc is edited, reload it
if g:isWin == 1
	autocmd! bufwritepost .vimrc source $VIM/vimfiles/vimrc
else
	autocmd! bufwritepost .vimrc source ~/.vim/vimrc
endif

" Sets what is saved when you save a session
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize

set mouse=a " Enable the mouse
behave xterm
set selectmode=mouse

" Default size of window
if has("gui_running")
	set columns=120
	set lines=45
endif

" set path
set path=.,include/*,head/*,../include/*,../head/*,,

if MySys() == "mac"
	set noimd
	if has("gui_running")
		set imactivatekey=C-space
		inoremap <ESC> <ESC>:set iminsert=1<CR>
	endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the curors - when moving vertical..
set so=5
set wildmenu "Turn on WiLd menu
set ruler "Always show current position
set cmdheight=1 "The commandbar height
set hid "Change buffer - without saving

" Set backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase "Ignore case when searching
set hlsearch "Highlight search things
set incsearch "Make search act like search in modern browsers
set magic "Set magic on, for regular expressions
set showmatch "Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=

" Window split
set equalalways " Multiple windows, when created, are equal in size
set splitbelow splitright

"Vertical split then hop to new buffer
:noremap <leader>v :vsp^M^W^W<cr>
:noremap <leader>h :split^M^W^W<cr>
set cursorline	"hightlight current line
"set cursorcolumn "hightlight current column

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors Fonts and Encodings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable "Enable syntax hl

" Set font according to system
if MySys() == "mac"
	"set gfn=Andale\ Mono:h14
	set gfn=Envy\ Code\ R:h13
	set shell=/bin/zsh
elseif MySys() == "windows"
	set gfn=Envy_Code_R:h10
elseif MySys() == "linux"
	set gfn=Envy\ Code\ R\ 10
	set shell=/bin/zsh
endif

if has("gui_running")
	set guioptions-=T
	set background=dark
	set t_Co=256
	set background=dark
	" colorscheme inkpot
	colorscheme desertEx
	set nu
else
	colorscheme desert
	set background=dark
	set nonu
endif

" Set utf-8 is the default encoding
set fileencoding=utf-8
" set fileencodings=ucs-bom,utf-8,gbk,gb2312,latin1,default
if (g:isWin)
	let &termencoding=&encoding " under win32 encoding is cp936
	set fileencodings=utf8,cp936,ucs-bom,latin1
else
	set encoding=utf8
	set fileencodings=utf8,gb2312,gb18030,ucs-bom,latin1
endif
try
	lang en_US
catch
endtry

set ffs=unix,dos,mac "Default file types

"Change current buffer encoding to cp936 (default is utf-8)
nmap <leader>fcn :set fileencoding=cp936<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile

" To show current filetype use: set filetype
autocmd FileType html :set filetype=xhtml " we couldn't care less about html
autocmd BufNewFile,BufRead *.as :set filetype=actionscript " change as from altas to actionscript.
autocmd BufNewFile,BufRead *.dox :set filetype=doxygen " define dox file as doxygen file

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\   exe "normal! g`\"" |
			\ endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set expandtab
set noexpandtab
set shiftwidth=4
set tabstop=4
set smarttab

set lbr
set tw=500

set ai "Auto indent
set si "Smart indet
set wrap "Wrap lines

map <leader>t2 :setlocal shiftwidth=2<cr>
map <leader>t4 :setlocal shiftwidth=4<cr>
map <leader>t8 :setlocal shiftwidth=4<cr>


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Really useful!
"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSearch('gv')<CR>
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

function! CmdLine(str)
	exe "menu Foo.Bar :" . a:str
	emenu Foo.Bar
	unmenu Foo
endfunction 

" From an idea by Michael Naumann
function! VisualSearch(direction) range
	let l:saved_reg = @"
	execute "normal! vgvy"

	let l:pattern = escape(@", '\\/.*$^~[]')
	let l:pattern = substitute(l:pattern, "\n$", "", "")

	if a:direction == 'b'
		execute "normal ?" . l:pattern . "^M"
	elseif a:direction == 'gv'
		call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
	elseif a:direction == 'f'
		execute "normal /" . l:pattern . "^M"
	endif

	let @/ = l:pattern
	let @" = l:saved_reg
endfunction



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart mappings on the command line
cno $h e ~/
cno $d e ~/Desktop/
cno $j e ./
cno $c e <C-\>eCurrentFileDir("e")<cr>

" $q is super useful when browsing on the command line
cno $q <C-\>eDeleteTillSlash()<cr>

" Bash like keys for the command line
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>      <C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

func! Cwd()
	let cwd = getcwd()
	return "e " . cwd 
endfunc

func! DeleteTillSlash()
	let g:cmd = getcmdline()
	if MySys() == "linux" || MySys() == "mac"
		let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
	else
		let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
	endif
	if g:cmd == g:cmd_edited
		if MySys() == "linux" || MySys() == "mac"
			let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
		else
			let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
		endif
	endif   
	return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
	return a:cmd . " " . expand("%:p:h") . "/"
endfunc


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <silent> <leader><cr> :noh<cr>

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <C-C> <C-W>c

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,300 bd!<cr>

" Use the arrows to something usefull
map <right> :bn<cr>
map <left> :bp<cr>

" Tab configuration
map <leader>tn :tabnew %<cr>
map <leader>te :tabedit 
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t1 :tabnext 1<cr>
map <leader>t2 :tabnext 2<cr>
map <leader>t3 :tabnext 3<cr>
map <leader>t4 :tabnext 4<cr>
map <leader>t5 :tabnext 5<cr>
map <leader>t6 :tabnext 6<cr>

" switch tabs by tab and numbers
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

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>

command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
	let l:currentBufNum = bufnr("%")
	let l:alternateBufNum = bufnr("#")

	if buflisted(l:alternateBufNum)
		buffer #
	else
		bnext
	endif

	if bufnr("%") == l:currentBufNum
		new
	endif

	if buflisted(l:currentBufNum)
		execute("bdelete! ".l:currentBufNum)
	endif
endfunction

" Specify the behavior when switching between buffers 
try
	set switchbuf=usetab
	set stal=2
catch
endtry


""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
" Always hide the statusline
set laststatus=2
set showcmd
" Format the statusline
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c


function! CurDir()
	let curdir = substitute(getcwd(), $HOME, "~/", "g")
	return curdir
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket expanding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap <leader>( <esc>`>a)<esc>`<i(<esc>
vnoremap <leader>[ <esc>`>a]<esc>`<i[<esc>
vnoremap <leader>{ <esc>`>a}<esc>`<i{<esc>
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>
vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>

" Map auto complete of (, ", ', [
inoremap <leader>( ()<esc>i
inoremap <leader>[ []<esc>i
inoremap <leader>{ {}<esc>i
inoremap <leader>} {<esc>o}<esc>O
inoremap <leader>' ''<esc>i
inoremap <leader>" ""<esc>i


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Abbrevs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab idate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
iab isign <c-r>="Louis @ " . strftime("%a %d %b %Y")

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Remap VIM 0
map 0 ^

"Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if MySys() == "mac"
	nmap <D-j> <M-j>
	nmap <D-k> <M-k>
	vmap <D-j> <M-j>
	vmap <D-k> <M-k>
endif

"Delete trailing white space, useful for Python ;)
func! DeleteTrailingWS()
	exe "normal mz"
	%s/\s\+$//ge
	exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

" Professor VIM says '87% of users prefer jj over esc', jj abrams strongly disagrees
imap ,, <Esc>
" awesome, inserts new line without going into insert mode
map <C-Enter> O<ESC>
map <S-Enter> o<ESC>

" Make cursor move by visual lines instead of file lines (when wrapping)
"map <up> gk
"imap <up> <C-o>gk
"map <down> gj
"imap <down> <C-o>gj
"map E ge
"map k gk
"map j gj

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Cope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Do :help cope if you are unsure what cope is. It's super useful!
map <leader>qc :botright cope<cr>
map <leader>qn :cn<cr>
map <leader>qp :cp<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Cscope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" use quick fix window for cscope output
set cscopequickfix=s-,c-,d-,i-,t-,e-


""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1


""""""""""""""""""""""""""""""
" => Minibuffer plugin
""""""""""""""""""""""""""""""
let g:miniBufExplModSelTarget = 1
let g:miniBufExplorerMoreThanOne = 2
let g:miniBufExplModSelTarget = 0
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplVSplit = 25
let g:miniBufExplSplitBelow=1

let g:bufExplorerSortBy = "name"

autocmd BufRead,BufNew :call UMiniBufExplorer

map <leader>u :TMiniBufExplorer<cr>:TMiniBufExplorer<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

""""""""""""""""""""""""""""""
" => Restructure text section
""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.rest set syntax=rest
au BufNewFile,BufRead *.rest set ft=rest

""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
au FileType python set nocindent
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python inoremap <buffer> $r return 
au FileType python inoremap <buffer> $i import 
au FileType python inoremap <buffer> $p print 
au FileType python inoremap <buffer> $f #--- PH ----------------------------------------------<esc>FP2xi
au FileType python map <buffer> <leader>1 /class 
au FileType python map <buffer> <leader>2 /def 
au FileType python map <buffer> <leader>C ?class 
au FileType python map <buffer> <leader>D ?def 


""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent

au FileType javascript imap <c-t> AJS.log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi

au FileType javascript inoremap <buffer> $r return 
au FileType javascript inoremap <buffer> $f //--- PH ----------------------------------------------<esc>FP2xi

function! JavaScriptFold() 
	setl foldmethod=syntax
	setl foldlevelstart=1
	syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

	function! FoldText()
		return substitute(getline(v:foldstart), '{.*', '{...}', '')
	endfunction
	setl foldtext=FoldText()
endfunction

""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated .git'
set grepprg=/bin/grep\ -nH


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" -----------------------------------------------------------------------------  
" |                              Pluggins                                     |
" -----------------------------------------------------------------------------  
"
" XPTemplate ******************************************************************
let g:xptemplate_always_show_pum = 1
" xpt uses <Tab> as trigger key
let g:xptemplate_key = '<Tab>'
" if nothing matched in xpt, try supertab
let g:xptemplate_fallback = '<Plug>SuperTabForward'
let g:xptemplate_highlight = 'following,next'
"let g:xptemplate_bundle = 'c_*,cpp_*' 

" Omni Completion *************************************************************
" http://www.vim.org/scripts/script.php?script_id=1520
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType html :set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType c set omnifunc=ccomplete#Complete
" 

" EnhancedCommentify **********************************************************
" http://www.vim.org/scripts/script.php?script_id=23
" ver 2.3
let g:EnhCommentifyRespectIndent = 'Yes'	
let g:EnhCommentifyPretty = 'Yes'

" NERDTree ********************************************************************
" http://www.vim.org/scripts/script.php?script_id=1658
" ver 4.1.0
let g:NERDTreeIgnore=['\~$', '\.o$', 'tags', 'cscope\.']
let g:NERDTreeWinPos="left"
nnoremap <silent> <leader>nt :NERDTreeToggle<CR>
nnoremap <silent> <leader>nc :call NERDTreeCurrentDir()<CR>

function! NERDTreeCurrentDir()
	let s:cwd = getcwd()
	execute "NERDTree " . s:cwd
endfunction

" Tag List ********************************************************************
" http://www.vim.org/scripts/script.php?script_id=273
" ver 4.5
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window = 1
nnoremap <silent> <F6> :TlistToggle<CR>

" Snip Mate **************************************************************
" http://www.vim.org/scripts/script.php?script_id=2540
" ver 0.83
let g:snips_author = "Louis Huang"
let g:snips_company = "YQIdea"
let g:snips_email = "louis.huang@yqidea.com"

function! ReloadSnippets( snippets_dir, ft )
	if strlen( a:ft ) == 0
		let filetype = "_"
	else
		let filetype = a:ft
	endif

	call ResetSnippets()
	call GetSnippets( a:snippets_dir, filetype )
endfunction

nmap <silent> <leader>sr :call ReloadSnippets(snippets_dir, &filetype)<CR>

" Fuzzyfinder *****************************************************************
" http://www.vim.org/scripts/script.php?script_id=1984
" ver 3.5
let g:fuf_modesDisable = [ ]
let g:fuf_previewHeight = 0		" disable preview
let g:fuf_keyPreview = '<C-]>'
map <leader>ff :FufFile<CR>
map <leader>fb :FufBuffer<CR>
map <leader>ft :FufTag!<CR>
map <leader>fm :FufMruFile!<CR>

try
	call fuf#defineLaunchCommand('FufCWD', 'file', 'fnamemodify(getcwd(), ''%:p:h'')')
	map <leader>ft :FufCWD **/<CR>
catch
endtry

" autocomplpop ***************************************************************
" http://www.vim.org/scripts/script.php?script_id=1879
" ver 2.14.1
let g:acp_enableAtStartup = 1
let g:acp_ignorecaseOption = 1
let g:acp_mappingDriven = 1

" a.vim **********************************************************************
let g:alternateSearchPath = 'sfr:../source,sfr:../src,sfr:../include,sfr:../inc,sfr:../../head/core:../sdk:../head'

" minibufexpl ****************************************************************
let g:miniBufExplSplitBelow = 0 " mini buf window will apear above.
let g:miniBufExplMapCTabSwitchBufs = 1 " use C-Tab and C-S-Tab to switch bufs.
let g:miniBufExplModSelTarget = 1 " Don't put buf in nonmodifiable window.
let g:miniBufExplMinSize = 1 " at least display 1 line.
let g:miniBufExplMaxSize = 2 " max display 2 line.

" surround   ****************************************************************
" http://www.vim.org/scripts/script.php?script_id=1697
" ver: 1.90

" supertab 	 ****************************************************************
" http://www.vim.org/scripts/script.php?script_id=1643
" ver: 1.0
" let g:SuperTabDefaultCompletionType = "context"

