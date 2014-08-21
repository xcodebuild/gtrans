# gtrans

## Introduction 介绍

gtrans is a vim plugin which allow you to translate words or sentences by using Google Translate.

gtrans 是一个基于 Google Translate 的 vim 插件，可以翻译词语和句子。

## Requirements 要求

- vim compiled with python (+python option) 

    包含 python 支持的 vim
 
- [requests](https://github.com/kennethreitz/requests) 

## Install 安装

`Plugin 'CodeFalling/gtrans'` 

## Variables 变量

    let g:gtrans_input_language = 'en'      # 要翻译的语言，默认为英文
    let g:gtrans_output_language = 'zh-CN'  # 翻译为，默认为简体中文

## Usage 使用

Add below to your .vimrc to bind key 

将下面的代码加入你的  .vimrc 以绑定按键

```
nmap <C-t> :Gtrans<CR>
imap <C-t> <ESC>:Gtrans<CR>
vmap <C-t> :call Gtrans()<CR>
```

## ScreenShot 截屏

![word](http://img2.picbed.org/uploads/2014/08/gtrans.jpg)

![sentence](http://img2.picbed.org/uploads/2014/08/gtrans_sentence.jpg)
