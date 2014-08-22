# gtrans

## Introduction 介绍

gtrans is a vim plugin which allow you to translate words or sentences by using Google Translate.

gtrans 是一个基于 Google Translate 的 vim 插件，可以翻译词语和句子。

## Requirements 要求

- vim compiled with python (+python option) 

    包含 python 支持的 vim

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
imap <C-t> <ESC>:Gtrans<CR>i
vmap <C-t> :call Gtrans()<CR>
```

## Features 特性

- Show result with new window. 

用一个弹出窗口显示翻译结果

- Auto exit Vim when only translate window 

当只剩下翻译窗口时自动退出 Vim

## ScreenShot 截屏

![word](http://falling-static.qiniudn.com/v0.2gtrans.jpg.jpg)

![sentence](http://falling-static.qiniudn.com/v0.2gtrans_sen.jpg.jpg)
