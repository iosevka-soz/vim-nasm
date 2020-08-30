if (exists("g:loaded_vim_nasm"))
    finish
endif


function! s:Run_nasm()
    let s:call_key = system('printf ''%s'' $RANDOM')
    let s:default_template = "/tmp/vim_nasm_run" . s:call_key
    let s:curr_full_path = expand('%:p')

    if(!exists("g:vim_nasm_disable_auto_write"))
        execute "normal! :write"<CR>
    endif

    if (exists("g:nasm_run")) && (exists("g:linker_run"))
        let s:nasm_run = printf("%s -o %s.o", g:nasm_run, s:default_template)
        let s:linker_run = printf("%s -o %s", g:linker_run, s:default_template)
    else
        if (!exists("g:vim_nasm_disable_default_warning"))
            echo "Vim_Nasm: Variables 'g:nasm_run' AND/OR 'g:linker_run' are not defined, using defaults.\n"
        endif

        let s:nasm_run = "nasm -f elf64 -F dwarf -wall -o " . s:default_template . "\.o"
        let s:linker_run = "ld -o /tmp/vim_nasm_run" . s:call_key
    endif
    call <SID>do_run()
endfunction

function! s:do_run()
    let l:run_line = printf("%s %s && %s %s.o && %s && rm -f %s %s.o\n", s:nasm_run, shellescape(s:curr_full_path), s:linker_run, s:default_template, s:default_template, s:default_template, s:default_template)
    echo l:run_line
    execute "below 10split | terminal " . l:run_line
endfunction

command! RunNasm call <SID>Run_nasm()
