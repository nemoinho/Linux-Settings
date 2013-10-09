"
" Besetzte Tastenkürzel: (im Moment falsch!!)
"
"-- F2 : tagbar öffnen, das ist die Klassenoutline
"-- F3 : undoTree
"-- F7 : sprache ändern
"-- F9 : getter/setter in php in Klasse schreiben (nur php)
"-- F12 : Projectbäume anzeigen gilt nur für eclim!
"
" Strg+n : neuer Tab
" Strg+i : nächsten Tab anspringen
" Strg+u : vorherigen Tab anspringen
" Strg+Rechts : nächsten Tab anspringen
" Strg+Links : vorherigen Tab anspringen
" Strg+h : Fenster links anspringen
" Strg+j : Fenster unten anspringen
" Strg+k : Fenster oben anspringen
" Strg+l : Fenster rechts anspringen
" Alt+Links : Fenster links anspringen
" Alt+Unten : Fenster unten anspringen
" Alt+Oben : Fenster oben anspringen
" Alt+Rechts : Fenster rechts anspringen
"
" Installed Plugins :
" undotree 4.3 - http://www.vim.org/scripts/script.php?script_id=4177
"

filetype indent plugin on
syntax on
set nocompatible
set number
set nowrap
set tabstop=4
set shiftwidth=4
nmap <C-n>     :tabnew  <CR>
nmap <C-l>     :tabnext <CR>
nmap <C-h>     :tabprev <CR>
nmap <C-Left>  :tabprev <CR>
nmap <C-Right> :tabnext <CR>
nmap <C-Left>  :wincmd h<CR>
nmap <C-Down>  :wincmd j<CR>
nmap <C-Up>    :wincmd k<CR>
nmap <C-Right> :wincmd l<CR>
nmap <A-h> :wincmd h<CR>
nmap <A-j> :wincmd j<CR>
nmap <A-k> :wincmd k<CR>
nmap <A-l> :wincmd l<CR>
nmap <A-Left>  :wincmd h<CR>
nmap <A-Down>  :wincmd j<CR>
nmap <A-Up>    :wincmd k<CR>
nmap <A-Right> :wincmd l<CR>

nmap <F3>      :UndotreeToggle<CR>
let g:snips_author = 'Felix Nehrke'

au BufRead,BufNewFile *.tex set ft=tex
au BufRead,BufNewFile *.css set ft=css
au BufRead,BufNewFile *.html set ft=xhtml
au BufRead,BufNewFile *.xhtml set ft=xhtml
au BufRead,BufNewFile *.htm set ft=xhtml
au BufRead,BufNewFile *.tpl set ft=xhtml
au BufRead,BufNewFile *.build set ft=xml
au BufRead,BufNewFile *.vimrc set ft=vim
au BufRead,BufNewFile *.vim set ft=vim

au BufNewFile *.xml 0r ~/.vim/tpls/xml.tpl | let IndentStyle = "xml"
au BufNewFile *.html 0r ~/.vim/tpls/html.tpl | let IndentStyle = "html"
au BufNewFile *.class.php source ~/.vim/tpls/php-class.tpl | let IndentStyle = "php"
