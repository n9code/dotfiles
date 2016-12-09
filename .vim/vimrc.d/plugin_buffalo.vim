" Buffer Colors
hi BuffaloCurrent ctermfg=8 ctermbg=3
hi BuffaloActive ctermfg=3 ctermbg=10
hi BuffaloHidden ctermfg=8 ctermbg=10
hi BuffaloFill ctermfg=0 ctermbg=10

" Separator Colors
hi BuffaloRSepHiddenHidden ctermfg=8 ctermbg=10
hi default link BuffaloRSepHiddenLast BuffaloRSepHiddenHidden
hi default link BuffaloRSepActiveHidden BuffaloRSepHiddenHidden
hi default link BuffaloLSepHiddenActive BuffaloRSepHiddenHidden
hi default link BuffaloRSepActiveActive BuffaloRSepHiddenHidden

hi BuffaloRSepCurrentHidden ctermfg=3 ctermbg=10
hi BuffaloLSepHiddenCurrent ctermfg=10 ctermbg=3
hi BuffaloRSepCurrentActive ctermfg=3 ctermbg=10
hi BuffaloLSepActiveCurrent ctermfg=10 ctermbg=3

" hi BuffaloRSepActiveHidden ctermfg=11 ctermbg=10
" hi BuffaloLSepHiddenActive ctermfg=10 ctermbg=11

hi default link BuffaloRSepCurrentLast BuffaloRSepCurrentHidden
hi default link BuffaloRSepActiveLast BuffaloRSepActiveHidden

" Separator Symbols
let g:buffalo_rsep_current_hidden = "\ue0b0"
let g:buffalo_rsep_current_active = "\ue0b0"
let g:buffalo_lsep_hidden_current = "\ue0b0"
let g:buffalo_lsep_active_current = "\ue0b0"

let g:buffalo_lsep_hidden_active = "\ue0b1"
let g:buffalo_rsep_active_hidden = "\ue0b1"

let g:buffalo_rsep_hidden_hidden = "\ue0b1"
let g:buffalo_rsep_active_active = "\ue0b1"

let g:buffalo_rsep_hidden_last = "\ue0b1"
let g:buffalo_rsep_current_last = "\ue0b0"
let g:buffalo_rsep_active_last = "\ue0b1"
