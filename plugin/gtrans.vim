if !exists('g:gtrans_input_language')
    let g:gtrans_input_language = 'en'
endif

if !exists('g:gtrans_output_language')
    let g:gtrans_output_language = 'zh_CN'
endif

pyfile <sfile>:p:h/gtrans.py

func! s:ShowTransWindow(string) " [[[
    let @z = a:string
    let s:return_to_window = winnr()
    if bufexists("TransWindow") > 0
        sil! bwipeout TransWindow
    endif

    silent botright new TransWindow

    if bufexists("TransWindow") > 0
        "set buftype=nofile
        sil normal "zP

        resize 2

        " Set up scratch buffer.
        setlocal bufhidden=wipe buftype=nofile
        setlocal nobuflisted nomodifiable noswapfile wrap
        nnoremap <buffer> <silent> q :hide<CR>
    endif
    execute s:return_to_window . "wincmd w"
endfunc

function! Gtrans()
    python vim_gtranslate()
endfunction

command! -nargs=0 Gtrans call Gtrans()
function! s:Exit_Only_Window()
    " Before quitting Vim, delete the taglist buffer so that
    " the '0 mark is correctly set to the previous buffer.
    if v:version < 700
    if winbufnr(2) == -1
        bdelete
        quit
    endif
    else
    if winbufnr(2) == -1
        if tabpagenr('$') == 1
        " Only one tag page is present
        bdelete
        quit
        else
        " More than one tab page is present. Close only the current
        " tab page
        close
        endif
    endif
    endif
endfunction

 autocmd BufEnter TransWindow nested call s:Exit_Only_Window()
