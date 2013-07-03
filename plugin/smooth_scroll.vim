" Smooth Scroll
"
" Written by Brad Phelan 2006
" http://xtargets.com
"
" Updated by Bruce Woodward 2013.
"

" This code couldn't be compatible.
if exists("g:smooth_scroll") || &cp
  finish
endif

let g:smooth_scroll = 1

let g:scroll_factor = 20000

function! s:half_screen()
  return &scroll
endfunction

function! s:full_screen()
  return winheight(0)
endfunction

function! SmoothScroll(dir, nlines)
  let i=0
  while i < a:nlines
    let t1=reltime()
    let i = i + 1
    if a:dir == "d"
      execute "normal \<c-e>j"
    else
      execute "normal \<c-y>k"
    end
    redraw
    while 1
      let t2=reltime(t1,reltime())
      sleep 20m
      if t2[1] > g:scroll_factor
        break
      endif
    endwhile
  endwhile
endfunction

nmap <c-d> :call SmoothScroll("d", &scroll)<cr>
nmap <c-u> :call SmoothScroll("u", &scroll)<cr>
nmap <c-f> :call SmoothScroll("d", winheight(0))<cr>
nmap <c-B> :call SmoothScroll("u", winheight(0))<cr>
