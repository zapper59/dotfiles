"Added for https://github.com/sentientmachine/erics_vim_syntax_and_color_highlighting

set background=dark
filetype on
filetype plugin indent on

au BufReadPost *.twig colorscheme koehler
au BufReadPost *.css colorscheme slate
au BufReadPost *.js colorscheme slate2
au BufReadPost *.py colorscheme molokaiyo
au BufReadPost *.html colorscheme monokai
au BufReadPost *.java colorscheme monokai
au BufReadPost *.php colorscheme monokai

" Default line highlighting for unknown filetypes
hi String ctermfg=140
hi CursorLine ctermbg=235
hi CursorLine guibg=#D3D3D3 cterm=none

autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

"start of my vimrc
inoremap <F10> <ESC>
nnoremap <F10> <ESC>
vnoremap <F10> <ESC>
xnoremap <F10> <ESC>
cnoremap <F10> <ESC>
onoremap <F10> <ESC>
snoremap <F10> <ESC>

set nocompatible
set tabstop=4
set softtabstop=4
set number
set shiftwidth=4
set smarttab
set autoindent
set smartindent
noremap <F2> :set invpaste paste?<CR>i
set pastetoggle=<F2>
set ic
set hls
"set nowrap"
"set listchars=tab:Â».,eol:.,trail:Â¶
"set listchars=tab:>.,eol:~,trail:!
set listchars=tab:».,eol:¶,trail:·
"set listchars=tab:fu,eol:~,trail:^

autocmd BufRead * set textwidth=0
autocmd BufNewFile,BufRead *.gradle setf groovy
syntax on
set mouse=a

"set foldmethod=manual
"autocmd BufWinLeave *.* mkview!
"autocmd BufWinEnter *.* silent loadview

highlight ExtraWhitespace ctermbg=darkred guibg=#382424
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

"colorscheme solarized
"colorscheme desert
colorscheme monokai

imap jj <ESC>
cmap jj <ESC>
nmap <M-h> <C-w>h
nmap <M-j> <C-w>j
nmap <M-k> <C-w>k
nmap <M-l> <C-w>l
 
"""" Toggle invisible characters
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
"set listchars=tab:?\ ,eol:Â¬
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Allow backspace whenever we want it
set backspace=indent,eol,start

"""CSV edit command"""
" http://vim.wikia.com/wiki/Working_with_CSV_files
" Highlight a column in csv text.
" :Csv 1    " highlight first column
" :Csv 12   " highlight twelfth column
" :Csv 0    " switch off highlight
function! CSVH(colnr)
  if a:colnr > 1
    let n = a:colnr - 1
    execute 'match Keyword /^\([^,]*,\)\{'.n.'}\zs[^,]*/'
    execute 'normal! 0'.n.'f,'
  elseif a:colnr == 1
    match Keyword /^[^,]*/
    normal! 0
  else
    match
  endif
endfunction
command! -nargs=1 Csv :call CSVH(<args>)
"""End CSV edit command"""
set t_Co=256
set list

nmap <C-a> ggvG$
nmap <C-h> v0
nmap <C-l> v$
autocmd InsertLeave * redraw!
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/

cmap sudow w !sudo tee % >/dev/null


" Currently using spaces instead of tabs
set expandtab
set shiftwidth=2

au BufRead,BufNewFile,BufEnter ~/projects/378/** setlocal noexpandtab

" TabToggle command from vim wikia
function TabSwitch()
   if &expandtab
      set noexpandtab
   else
      set expandtab
   endif
   echo &expandtab
endfunction
map <F9> mz:execute TabSwitch()<CR>'z
map! <F9> <C-o>:execute TabSwitch()<CR>

set noswapfile
