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
        setlocal nobuflisted nomodifiable noswapfile nowrap
        nnoremap <buffer> <silent> q :hide<CR>
    endif
    execute s:return_to_window . "wincmd w"
endfunc

function! Gtrans()
    python vim_gtranslate()
endfunction

command! -nargs=0 Gtrans call Gtrans()

