"
" Installed Plugins :
" undotree 4.3 - http://www.vim.org/scripts/script.php?script_id=4177
" snipMate - http://www.vim.org/scripts/script.php?script_id=2540
"
" Needed files :
" ~/.vim/spell/de.utf-8.spl from ftp://ftp.vim.org/pub/vim/runtime/spell/
" ~/.vim/spell/de.utf-8.sug from ftp://ftp.vim.org/pub/vim/runtime/spell/
" ~/.vim/spell/en.utf-8.spl from ftp://ftp.vim.org/pub/vim/runtime/spell/
" ~/.vim/spell/en.utf-8.sug from ftp://ftp.vim.org/pub/vim/runtime/spell/
"

" Basic settings
filetype indent plugin on
syntax on
set nocompatible
set number
set nowrap
set expandtab
set tabstop=4
set shiftwidth=4
set colorcolumn=80
set background=dark

" Show non-visible chars
set listchars=tab:→\ ,trail:·,eol:$,nbsp:_,extends:»,precedes:«
set list

" search in all parent-folders for an tags file
set tags=tags;/
" recreate ctags on each save-prozess
" TODO
" au BufWritePost,FileAppendPost,FileWritePost *.php !~/bin/recreate_ctags

" Navigation
nnoremap <C-n>     :tabnew  <CR>
nnoremap <C-l>     :tabnext <CR>
nnoremap <C-h>     :tabprev <CR>
nnoremap <C-Left>  :wincmd h<CR>
nnoremap <C-Down>  :wincmd j<CR>
nnoremap <C-Up>    :wincmd k<CR>
nnoremap <C-Right> :wincmd l<CR>

" toggle undotree
nmap <F3>      :UndotreeToggle<CR>

" snipMate settings
let g:snips_author = 'Felix Nehrke'

" new files
au BufRead,BufNewFile *.tex set ft=tex
au BufRead,BufNewFile *.css set ft=css
au BufRead,BufNewFile *.html set ft=xhtml
au BufRead,BufNewFile *.xhtml set ft=xhtml
au BufRead,BufNewFile *.htm set ft=xhtml
au BufRead,BufNewFile *.tpl set ft=xhtml
au BufRead,BufNewFile *.build set ft=xml
au BufRead,BufNewFile *.vimrc set ft=vim
au BufRead,BufNewFile *.vim set ft=vim

" create a basic wrapper for new files of these types
au BufNewFile *.xml 0r ~/.vim/tpls/xml.tpl | let IndentStyle = "xml"
au BufNewFile *.html 0r ~/.vim/tpls/html.tpl | let IndentStyle = "html"

" vim-autocorrect prosa
" dirty solution from https://aaron-mueller.de/artikel/vim-mastery-korrigiert
" Switch between different languages
let g:myLang = 0  
let g:myLangList = [ "Off", "German", "English" ]  
function! ChangeSpellLang()  
	if g:myLang == 0 | set nospell | endif  
	if g:myLang == 1 | setlocal spell spelllang=de_20 | endif  
	if g:myLang == 2 | setlocal spell spelllang=en_us | endif  
	echo "language:" g:myLangList[g:myLang]  
	let g:myLang = g:myLang + 1  
	if g:myLang >= len(g:myLangList) | let g:myLang = 0 | endif  
endfunction  
map <F7> :call ChangeSpellLang()<CR> 
" colorize correction-offers
hi SpellBad ctermbg=52 ctermfg=9
" limit offers to 8
set spellsuggest=8

" searching
" highlight search results
set hls
" search case-sensivite only if there are upper-chars in search or it ends by
" \C
set smartcase

" reset the colorcolumn to 72 in gitcommits
au FileType gitcommit set colorcolumn=72

" copy selected rows or whole file into clipboard with Ctrl+C
nnoremap <C-C> :w !xsel -b<CR><CR>
vnoremap <C-C> :w !xsel -b<CR><CR>
