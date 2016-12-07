" ============================================================================
" FILE: plugin/htmlbars-inline-syntax.vim
" AUTHOR: Dustin Farris
" ============================================================================

scriptencoding utf-8

function! hbs#highlight_hbs()

    " Load mustache syntax

    if exists('b:current_syntax')
        let s:current_syntax=b:current_syntax
        unlet b:current_syntax
    endif

    execute 'syntax include @SyntaxMUSTACHE syntax/mustache.vim'

    if exists('s:current_syntax')
        let b:current_syntax=s:current_syntax
    else
        unlet b:current_syntax
    endif


    " Apply syntax

    execute 'syntax match MatchMUSTACHE /hbs`\(\_.\{-}\)`/ keepend containedIn=jsObjectValue contains=@SyntaxMUSTACHE'

endfunction

command! HighlightInlineHbs : call hbs#highlight_hbs()
