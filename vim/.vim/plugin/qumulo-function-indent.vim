" ------------------------------------------------------------------------------
" Filename:     ~/.vim/plugin/qumulo-function-indent.vim
" Version:      1.0
" Author:       Ben Reeves
" Install:      Put this file in the vim plugins directory to load it
"               automatically, or load it with :so qumulo-function-indent.vim
" Description:  This script creates a command for auto-formatting C and Python
"               function declarations/definitions/calls.
" History:      1.0 - Initial version (June 2019)
" ------------------------------------------------------------------------------


" ------------------------------------------------------------------------------
" This vim script defines a function QumuloIndentFunction to automatically
" indent a python or C function according to our coding standards. This works
" for function declarations/definitions as well as function calls.
"
" To recap:
"   1) If the function fits on one line, put it on one line
"   2) If the function fits on two lines, put it on two lines
"   3) Otherwise, place each parameter on its own line.
"
" Before calling QumuloIndentFunction(), the cursor may be anywhere on any
" line within the function declaration/call.
"
" It also doesn't matter in which of the three states the function starts in.
" QumuloIndentFunction() will take care of it just fine.
"
" To bind this function to a key mapping, you can for example do:
" nnoremap <leader>f :call QumuloIndentFunction()<CR>
" ------------------------------------------------------------------------------

if !exists('g:qumulo_line_width')
  let g:qumulo_line_width=80
endif

function! s:CharUnderCursor()
  return getline('.')[col('.')-1]
endfunction

function! s:CurrentLineTooLong()
  return strdisplaywidth(getline('.')) > g:qumulo_line_width
endfunction

function! s:FindBeginningParen()
  " First just try to hit % and see if it brings us to a paren group
  execute "silent! normal! %"
  if s:CharUnderCursor() != '('
    " Otherwise just search for a ( on previous lines
    let s:maxLinesForwardOrBackward = 20
    let s:curline = line('.')
    let s:foundLine = search('(', 'bc')
    if s:foundLine == 0 ||
          \ abs(s:foundLine - s:curline) > s:maxLinesForwardOrBackward
      return [0, 0]
    endif
    " If found a (, make sure there's a matching ) on the other side of curline
    execute "normal! %"
    if line('.') < s:curline
      return [0, 0]
    endif
    " Bring back to beginning of paren group
    execute "normal! %"
  endif
  return [line('.'), col('.')]
endfunction

function! s:FindFunction()
  let s:functionRegex = '\v\S+\('
  " See if function declaration is on this line
  execute "normal! ^"
  let s:funcline = search(s:functionRegex, 'c', line('.'))
  " Otherwise go to beginning of paren group and see if declaration is there
  if s:funcline == 0
    " " We may be past the ')', so go back to it
    " execute 'silent! normal! F)'
    " Go to beginning of paren group
    " execute 'silent! normal! %'
    let s:parenPos = s:FindBeginningParen()
    if s:parenPos != [0, 0]
      let s:funcline = search(s:functionRegex, 'bcn', line('.'))
    endif
  else
    " Move to (
    execute 'normal! f('
  endif
  return s:funcline
endfunction

function! QumuloIndentFunction()
  let s:cursorStartLine = line('.')
  let s:cursorStartCol = col('.')

  if s:FindFunction() == 0
    echo 'No function to format'
    call cursor(s:cursorStartLine, s:cursorStartCol)
  endif

  " At this point, the cursor is resting on the open paren for the function.
  " Format the function as one line and see if it fits
  let s:parenPos = getcurpos()[1:]
  execute "silent! normal! v%:s/\\((\\|,\\)\\n\\s*/\\1/g\<cr>"
  call cursor(s:parenPos)
  execute "silent! normal! v%:s/,\\(\\S\\)/, \\1/g\<cr>"
  call cursor(s:parenPos)

  " If line too long, try it on two lines
  if s:CurrentLineTooLong()
    execute "normal! a\<cr>\<esc>"
  endif

  " If line still too long, do all parameters on their own line
  if s:CurrentLineTooLong()
    while 1
      let s:found = search(',\s*', '', line('.'))
      if s:found == 0
        break
      endif
      execute "normal! lxi\<cr>\<esc>"
    endwhile
  endif

  " Return cursor
  call cursor(s:cursorStartLine, s:cursorStartCol)
endfunction

command! QumuloIndentFunction call QumuloIndentFunction()
