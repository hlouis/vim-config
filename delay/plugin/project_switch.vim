command! -nargs=1 SwitchProjects call s:SwitchProjects ("<args>")

function s:SwitchProjects(arg)
    let bass = argv(0)
    let tag_file = bass . "/tags"
    let csc_file = bass . "/cscope.out"

    echo bass
    
    if filereadable(tag_file)
    	set tags=tags
    endif

    if filereadable(csc_file)
	cs add cscope.out
    endif

    cs add csc_file
endfunction
