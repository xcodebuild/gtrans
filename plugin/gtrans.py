import vim
import re
import requests
import string

def __do_visual(buff, cur, res=''):
    cursor = cur.window.cursor

    if cursor[0] == buff.mark('<')[0]:

        if buff.mark('<')[0] == buff.mark('>')[0]:

            return buff[
                buff.mark('<')[0] - 1][
                    buff.mark('<')[1]:buff.mark('>')[1]]
        else:
            res = buff[buff.mark('<')[0] - 1][buff.mark('<')[1]:]

            for x in xrange(buff.mark('>')[0] - buff.mark('<')[0] - 1):
                res = ' '.join((res, buff[buff.mark('<')[0] + x]))

            return ' '.join((
                res,
                buff[buff.mark('>')[0] - 1][:buff.mark('>')[1]]))


def translate(content , to_lang , from_lang , is_sentence = False):
    content = content.replace(' ','%20')
    url = "http://translate.google.cn/translate_a/single?client=t&sl=%s&tl=%s&hl=en&dt=bd&dt=ex&dt=ld&dt=md&dt=qc&dt=rw&dt=rm&dt=ss&dt=t&dt=at&dt=sw&ie=UTF-8&oe=UTF-8&oc=2&otf=2&rom=1&ssel=0&tsel=0&q=%s" % (from_lang,to_lang,content)
    text = requests.get(url).text.encode('utf-8')
    result = set(re.findall('"[\x90-\xff].*?"',text))
    if is_sentence:
        max_length_result = ""
        for x in result:
            max_length_result = x if len(x)>len(max_length_result) else max_length_result
        return max_length_result
    else:
        return '|  ' + "".join([x[1:-1]+' | ' for x in result])

def vim_gtranslate():
    to_lang = vim.eval('g:gtrans_output_language') or 'zh_CN'
    from_lang = vim.eval('g:gtrans_input_language') or 'en'


    buff = vim.current.buffer
    cur = vim.current
    cursor = cur.window.cursor
    res = ''
    is_sentence = False
    if buff.mark('<') and buff.mark('>') and cursor[1] == 0 \
            and buff.mark('<')[0] <= cursor[0] <= buff.mark('>')[0]:
        # visual mode
        res = __do_visual(buff, cur)
        is_sentence = True
    else:
        # cursor mode
        res = vim.eval('expand("<cword>")')

    translated = ''
    try:
        translated = translate(res if res else '' , to_lang , from_lang , is_sentence)
    except Exception:
        pass
    vim.command (':call s:ShowTransWindow("%s")' % translated)
