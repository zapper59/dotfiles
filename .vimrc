"Added for https://github.com/sentientmachine/erics_vim_syntax_and_color_highlighting

"Clear out all auto commands.
autocmd!

set background=dark
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

"autocmd BufReadPost *
"  \ if line("'\"") > 1 && line("'\"") <= line("$") |
"  \   exe "normal! g`\"" |
"  \ endif

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
"set listchars=tab:Â»,eol:.,trail:Â¶
"set listchars=tab:>.,eol:~,trail:!
set listchars=tab:>.,trail:!
"set listchars=tab:».,eol:¶,trail:·
"set listchars=tab:fu,eol:~,trail:^

"" NOT SURE WHY?!!
"autocmd BufRead * set textwidth=0
"autocmd BufNewFile,BufRead *.gradle setf groovy
syntax on
set mouse=a
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end

"set foldmethod=manual
"autocmd BufWinLeave *.* mkview!
"autocmd BufWinEnter *.* silent loadview

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
"nmap <C-l> v$
"autocmd InsertLeave * redraw!
"au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
"au InsertLeave * match ExtraWhitespace /\s\+$/

cmap sudow w !sudo tee % >/dev/null


" Currently using spaces instead of tabs
set expandtab
"set shiftwidth=2
set shiftwidth=4

au BufRead,BufNewFile,BufEnter ~/projects/378/** setlocal noexpandtab

"" TabToggle command from vim wikia
"function TabSwitch()
"   if &expandtab
"      set noexpandtab
"   else
"      set expandtab
"   endif
"   echo &expandtab
"endfunction
"map <F9> mz:execute TabSwitch()<CR>'z
"map! <F9> <C-o>:execute TabSwitch()<CR>

set noswapfile
scriptencoding utf-8
set encoding=utf-8

"" Vim fancy numbers
"set number relativenumber
"augroup numbertoggle
"  autocmd!
"  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
"augroup END

" START PHILLIP

""   VUNDLE SETUP
"set rtp
"source ~/.vim/bundles
"filetype plugin indent on
""   END VUNDLE
"
set scrolloff=20       " Maintain 10 lines on screen
set history=4000
set laststatus=2       " Always display the status line
set showcmd            " Display incomplete commands
"set noswapfile         " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set nobackup
set nowritebackup

set wildmenu           " Display all the options when autocompleting
set incsearch          " Do incremental searching

set autoread           " When a file changes, re-read it.
""set autowrite          " Automatically :write before running commands
""set lazyredraw         " Don't redraw unless you need to
"
set tabstop=4          " Tab characters are always 4 characters away
set shiftwidth=4       " A shiftwidth (indent) is 4 characters away
set softtabstop=4      " If inserting spaces, 4 spaces are right
set smarttab           " Use shiftwidth is the sole setting for tabs
set expandtab          " Use spaces instead of tabs
"
set textwidth=80       " Use 80 character-wide columns by default
set colorcolumn=+1     " Set a color column at textwidth + 1
"highlight ColorColumn ctermbg=7
"set path=,build/gen,   " Find source files in . and build/gen
"set makeprg=build      " build with build
"
let c_no_curly_error = 1
"set spell spelllang=en_us
"
"" TODO powerline
""py3 from powerline.vim import setup as powerline_setup
""py3 powerline_setup()
""py3 del powerline_setup
"
""colorscheme ron
"
"highlight clear SpellBad
"highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
"highlight clear SpellCap
"highlight SpellCap term=underline cterm=underline
"highlight clear SpellRare
"highlight SpellRare term=underline cterm=underline
"highlight clear SpellLocal
"highlight SpellLocal term=underline cterm=underline
"
set whichwrap=<,>,[,],b,s " must be set after filetype
"
"" Use rg exclusively
"if executable("rg")
"    set grepprg=rg\ --vimgrep\ --no-heading
"    set grepformat=%f:%l:%c:%m,%f:%l:%m
"    nnoremap <Leader>f :Rg<CR>
"endif
"
"" Use clang-format and rustfmt
"noremap <F3> :Autoformat<CR>
"let g:rustfmt_autosave = 1
"
"" Build everything
"noremap <F11> :Make<CR>
"
"" Build the file
"noremap <F12> :Make build/debug/%:r.c.bc<CR>
"noremap <S-F12> :Make build/debug/%.list<CR>
"" END PHILLIP
"

hi ColorColumn guibg=LightGray
"highlight ExtraWhitespace ctermbg=darkred guibg=#382424
"autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
