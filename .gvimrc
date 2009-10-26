" -----------------------------------------------------------------------------  
" |                            VIM Settings                                   |
" |                              GUI stuff                                    |
" -----------------------------------------------------------------------------  


" OS Specific *****************************************************************
if has("gui_macvim")

  set fuoptions=maxvert,maxhorz " fullscreen options (MacVim only), resized window when changed to fullscreen
  set guifont=Envy\ Code\ R\ 10
  set guioptions-=T  " remove toolbar

elseif has("gui_gtk2")

" set guifont=Droid\ Sans\ Mono\ 10
  set guifont=Envy\ Code\ R\ 10
"  set guifont=Monaco\ 10
"  color ir_black
  color northland
  set guioptions-=T  " remove toolbar

elseif has("x11")
elseif has("gui_win32")
    set guifont=Envy_Code_R:h10
"    set guifont=YaHei_Consolas_Hybrid:h10
	color northland
end

" General *********************************************************************
set anti " Antialias font
set vb t_vb= " Turn off the bell.

"set transparency=0

" Default size of window
set columns=120
set lines=45

set guitablabel=%t " set label for tab to just file name
