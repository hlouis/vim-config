" Vim color file
" Maintainer:   Louis huang <hlouis@gmail.com>
" Last Change:  Thu 21 Jun 2007

set background=light
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="louis"

hi Comment		gui=NONE		guifg=SeaGreen		guibg=NONE term=italic
hi Constant		gui=NONE		guifg=#004488 		guibg=NONE
"hi Identifier	gui=NONE		guifg=Blue			guibg=NONE
hi Statement 	gui=NONE		guifg=Blue			guibg=NONE
hi PreProc		gui=NONE		guifg=Blue			guibg=NONE	
hi Type			gui=NONE		guifg=Blue			guibg=NONE
hi Special		gui=NONE		guifg=SteelBlue	guibg=NONE
"hi Underlined	
"hi Ignore		
"hi Error		
"hi Todo		

hi LineNr term=none ctermfg=white ctermbg=darkgray
