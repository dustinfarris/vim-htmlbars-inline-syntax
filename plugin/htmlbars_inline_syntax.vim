" ============================================================================
" FILE: plugin/htmlbars-inline-syntax.vim
" AUTHOR: Dustin Farris
" ============================================================================

scriptencoding utf-8

function! htmlbars_inline_syntax#highlight()

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

    execute 'syntax match MatchMUSTACHE /hbs`\(\_.\{-}\)`/ keepend containedIn=jsFuncBlock,jsParen,jsObjectValue contains=@SyntaxMUSTACHE'

endfunction

command! HighlightInlineHbs : call htmlbars_inline_syntax#highlight()
