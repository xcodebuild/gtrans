# gtrans

## Introduction

gtrans is a vim plugin which allow you to translate words or sentences by using Google Translate.

## Requirements

- vim compiled with python (+python option)
- [requests](https://github.com/kennethreitz/requests)

## Variables

    let g:gtrans_input_language = 'en'
    let g:gtrans_output_language = 'zh-CN'

## Usage

Add below to your .vimrc to bind key 
        nmap <C-t> :Gtrans<CR>
        imap <C-t> <ESC>:Gtrans<CR>
        vmap <C-t> :call Gtrans()<CR>
