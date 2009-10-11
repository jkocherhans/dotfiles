" from http://b4winckler.wordpress.com/2009/07/10/a-minimal-vim-configuration/
set nocompatible
set bs=indent,eol,start
syntax on

" highlight searches and make the case insensetive if no caps are used
set hls is ic scs
" clear the current search highlighting in insert mode
nmap <silent> <esc> :noh<CR>

filetype plugin indent on
set ruler

set backup " make backup files
set backupdir=~/.vim/backup " where to put backup files
set directory=~/.vim/tmp " directory to place swap files in
set fileformats=unix,dos,mac " support all three, in this order


" Use 4 spaces for indentation and replace tabs with spaces in a smart way
set shiftwidth=4 softtabstop=4 expandtab
set tabstop=4

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set bg=dark
set guifont=Andale\ Mono:h10
set linespace=1                " Extra space between lines since Andale Mono has a short line height
colorscheme vilight
set number

set wildmode=longest,list
set suffixes+=.pyc
set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc,*.beam

set lines=60
set columns=110

set go-=T           " hide the toolbar (MacVim)
set guioptions=eg   " turn off scrollbars
set gcr=n:blinkon0  " don't blink in normal mode

set cursorline

set list
set listchars=tab:‣\ ,eol:¬,trail:· " show tabs, trailing whitespace, and linebreaks similar to TextMate

let Tlist_Ctags_Cmd='/usr/local/bin/ctags'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BufExplorer
"
let g:bufExplorerShowRelativePath=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" http://blog.golden-ratio.net/2008/08/19/using-tabs-in-vim/

function! GuiTabLabel()
        " add the tab number
        let label = '['.tabpagenr()

        " modified since the last save?
        let buflist = tabpagebuflist(v:lnum)
        for bufnr in buflist
                if getbufvar(bufnr, '&modified')
                        let label .= '*'
                        break
                endif
        endfor

        " count number of open windows in the tab
        let wincount = tabpagewinnr(v:lnum, '$')
        if wincount > 1
                let label .= ', '.wincount
        endif
        let label .= '] '

        " add the file name without path information
        let n = bufname(buflist[tabpagewinnr(v:lnum) - 1])
        let label .= fnamemodify(n, ':t')

        return label
endfunction

set guitablabel=%{GuiTabLabel()}




let g:python_highlight_all=1

command! Pyflakes :call Pyflakes()
function! Pyflakes()
    set makeprg=pyflakes
    make "%"
    cw
endfunction
