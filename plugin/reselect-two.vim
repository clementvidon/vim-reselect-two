" reselect-two - Reselect one of the last 2 VISUAL selections.
"
"   Like 'gv' which restores the last selection but adds 'gb'
"   which allows you to restore the previous selection.
"
" Created: 240117 02:47:02 by clem@spectre
" Updated: 240117 02:47:02 by clem@spectre
" Maintainer: Clément Vidon (clemedon)

" TODO Cursor position is not restored when the selection is restored
" TODO Some visual block selections are not restored correctly
"
" PLAN When visual selection start, save all keys pressed until the end of the
" selection, alongside with visualmode() and beg position.  Replay them like a
" macro when the selection is restored.

if exists('g:loaded_reselect_two')
    finish
endif
let g:loaded_reselect_two = 1

let g:selec_auto_save_disabled = 0
let g:last_visual_mode = ''
let g:prev_visual_mode = ''

if !exists('b:last_selec_beg')
    let b:last_selec_beg = []
endif

if !exists('b:last_selec_end')
    let b:last_selec_end = []
endif

if !exists('b:prev_selec_beg')
    let b:prev_selec_beg = []
endif

if !exists('b:prev_selec_end')
    let b:prev_selec_end = []
endif

function! SaveSelection()
    if g:selec_auto_save_disabled == 0
        let g:prev_visual_mode = g:last_visual_mode
        let g:last_visual_mode = visualmode()
        if exists('b:last_selec_beg') && exists('b:last_selec_end')
            echo "Selection saved."
            let b:prev_selec_beg = b:last_selec_beg
            let b:prev_selec_end = b:last_selec_end
        endif
        let b:last_selec_beg = getpos("'<")
        let b:last_selec_end = getpos("'>")
        if b:last_selec_end[2] > strlen(getline(b:last_selec_end[1]))
            let b:last_selec_end[2] = strlen(getline(b:last_selec_end[1]))
        endif
    else
        let g:selec_auto_save_disabled = 0
    endif
endfunction

augroup AutoSaveSelection
    autocmd!
    " triggered when ModeChanged from Visual to Normal
    autocmd ModeChanged [vV\x16]*:[nN\x16]* call SaveSelection()
augroup END

function! RestoreLastSelection()
    if exists('b:last_selec_beg') && exists('b:last_selec_end')
        let beg_y = b:last_selec_beg[1]
        let beg_x = b:last_selec_beg[2]
        let end_y = b:last_selec_end[1]
        let end_x = b:last_selec_end[2]

        if g:last_visual_mode == "\<C-V>"
            let height = abs(end_y - beg_y)
            let width = abs(end_x - beg_x)
            if end_y > beg_y && end_x > beg_x " top-l to bot-r = by,bx to ey,ex
                call cursor(beg_y, beg_x)
                execute "normal! \<Esc>\<C-V>"
                execute height == 0 ? '' : 'normal! ' . height . 'j'
                execute width == 0 ? '' : 'normal! ' . width . 'l'
            elseif end_y > beg_y && end_x < beg_x " top-r to bot-l = by,ex to ey,bx
                call cursor(beg_y, beg_x)
                execute "normal! \<Esc>\<C-V>"
                execute height == 0 ? '' : 'normal! ' . height . 'j'
                execute width == 0 ? '' : 'normal! ' . width . 'h'
            elseif end_y < beg_y && end_x > beg_x " bot-l to top-r = ey,bx to by,ex
                call cursor(end_y, beg_x)
                execute "normal! \<Esc>\<C-V>"
                execute height == 0 ? '' : 'normal! ' . height . 'k'
                execute width == 0 ? '' : 'normal! ' . width . 'l'
            elseif end_y < beg_y && end_x < beg_x " bot-r to top-l = ey,ex to by,bx
                call cursor(end_y, beg_x)
                execute "normal! \<Esc>\<C-V>"
                execute height == 0 ? '' : 'normal! ' . height . 'k'
                execute width == 0 ? '' : 'normal! ' . width . 'h'
            endif
        else
            call cursor(beg_y, beg_x)
            execute "normal! \<Esc>v"
            call cursor(end_y, end_x)
        endif
        let g:selec_auto_save_disabled = 1
    endif
endfunction

function! RestorePrevSelection()
    if exists('b:prev_selec_beg') && exists('b:prev_selec_end')
        let beg_y = b:prev_selec_beg[1]
        let beg_x = b:prev_selec_beg[2]
        let end_y = b:prev_selec_end[1]
        let end_x = b:prev_selec_end[2]

        if g:prev_visual_mode == "\<C-V>"
            let height = abs(end_y - beg_y)
            let width = abs(end_x - beg_x)
            if end_y > beg_y && end_x > beg_x " top-l to bot-r = by,bx to ey,ex
                call cursor(beg_y, beg_x)
                execute "normal! \<Esc>\<C-V>"
                execute height == 0 ? '' : 'normal! ' . height . 'j'
                execute width == 0 ? '' : 'normal! ' . width . 'l'
            elseif end_y > beg_y && end_x < beg_x " top-r to bot-l = by,ex to ey,bx
                call cursor(beg_y, beg_x)
                execute "normal! \<Esc>\<C-V>"
                execute height == 0 ? '' : 'normal! ' . height . 'j'
                execute width == 0 ? '' : 'normal! ' . width . 'h'
            elseif end_y < beg_y && end_x > beg_x " bot-l to top-r = ey,bx to by,ex
                call cursor(end_y, beg_x)
                execute "normal! \<Esc>\<C-V>"
                execute height == 0 ? '' : 'normal! ' . height . 'k'
                execute width == 0 ? '' : 'normal! ' . width . 'l'
            elseif end_y < beg_y && end_x < beg_x " bot-r to top-l = ey,ex to by,bx
                call cursor(end_y, beg_x)
                execute "normal! \<Esc>\<C-V>"
                execute height == 0 ? '' : 'normal! ' . height . 'k'
                execute width == 0 ? '' : 'normal! ' . width . 'h'
            endif
        else
            call cursor(beg_y, beg_x)
            execute "normal! \<Esc>v"
            call cursor(end_y, end_x)
        endif
        let g:selec_auto_save_disabled = 1
    else
        call RestoreLastSelection()
    endif
endfunction

noremap gv :call RestoreLastSelection()<CR>
noremap gb :call RestorePrevSelection()<CR>
