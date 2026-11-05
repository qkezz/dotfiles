set shortmess+=I
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
set expandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set number
set mouse=a

set list
set listchars=tab:»-,space:⋅,trail:·,nbsp:±
highlight NonText ctermfg=gray
highlight SpecialKey ctermfg=gray

syntax on
nnoremap <F2> :set list!<CR>
nnoremap <S-F2> :set relativenumber!<CR>
nnoremap <Tab> I    <Esc>

command! Html5 call append(line('.')-1, [
    \ '<!DOCTYPE html>',
    \ '<html lang="en">',
    \ '<head>',
    \ '    <meta charset="UTF-8">',
    \ '    <meta name="viewport" content="width=device-width, initial-scale=1.0">',
    \ '    <title>Document</title>',
    \ '</head>',
    \ '<body>',
    \ '    ',
    \ '</body>',
    \ '</html>'])

command! Linkcss normal! a<link rel="stylesheet" href="style.css">
