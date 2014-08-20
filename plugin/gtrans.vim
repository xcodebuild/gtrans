if !exists('g:gtrans_input_language')
    let g:gtrans_input_language = 'en'
endif

if !exists('g:gtrans_output_language')
    let g:gtrans_output_language = 'zh_CN'
endif

pyfile <sfile>:p:h/gtrans.py

function! Gtrans()
    python vim_gtranslate()
endfunction

command! -nargs=0 Gtrans call Gtrans()
