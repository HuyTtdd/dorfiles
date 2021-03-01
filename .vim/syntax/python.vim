let s:cpo_save = &cpo
set cpo&vim
" Statement: {{{
syn keyword pythonStatement class nextgroup=pythonClass skipwhite
syn keyword pythonStatement def nextgroup=pythonFunction skipwhite
syn keyword pythonStatement break continue del global assert
syn keyword pythonStatement pass return yield
syn keyword pythonStatement with as
syn match pythonStatement "\<yield\>" display
syn match pythonStatement "\<yield\s\+from\>" display

" }}}
" Conditional: {{{
syn keyword pythonConditional if else elif
syn keyword pythonRepeat for while
syn keyword pythonException except finally raise try

" }}}
" Async: {{{
syn keyword pythonAsync async await
syn match pythonAsync '\<async\s\+def\>' nextgroup=pythonFunction skipwhite
syn match pythonAsync '\<async\s\+with\>' display
syn match pythonAsync '\<async\s\+for\>' nextgroup=pythonRepeat skipwhite

" }}}
" Self: {{{
syn keyword pythonSelf self cls

" }}}
" Include: {{{
syn keyword pythonInclude import from
syn match pythonInclude '\<from\>' display

" }}}
" Operator: {{{
syn keyword pythonOperator and in is not or
syn match pythonOperator '\V\%(=\|-\|+\|*\|/\|@\|%\|&\||\|^\|~\|<\|>\|!=\)'

" }}}
" Decorator: {{{
syn match pythonDecorator '^\s*\zs@' display nextgroup=pythonDot skipwhite

" }}}
" Dot: {{{
syn match pythonDot '\.' display nextgroup=pythonDottedName,pythonFunctionCall
" syn match pythonDottedName '\%(\h\w*\%(\.\h\w*\)*\)' display contained
syn match pythonDottedName '\h\w*' contained

" }}}
" Class: {{{
syn match pythonClass '\h\w*' contained nextgroup=pythonClassVars skipwhite
syn region pythonClassVars start='(' end=')' contained contains=@pythonExpression

" }}}
" Function: {{{
syn match pythonFunction '\h\w*' contained nextgroup=pythonFunctionVars skipwhite
syn region pythonFunctionVars start='(' end=')' contained contains=pythonFunctionCall,pythonTypeHint,pythonFunctionKeyword,pythonFunctionParameter,@pythonExpression
syn match pythonFunctionCall '\h\w*\ze\s*(' nextgroup=pythonFunctionCallVars skipwhite
syn region pythonFunctionCallVars start='(' end=')' contained contains=pythonFunctionCall,pythonFunctionKeyword,@pythonExpression
syn match pythonFunctionParameter '\h\w*\%(\i*\.\|\i*\s*(\)\@!' contained
syn match pythonFunctionKeyword '\v\s{-}\zs\w+\ze\=(\=)@!(\_s)@!' display
syn match pythonTypeHint '\h\w*\ze\s*:\s*\i*' contained contains=pythonFunctionCall,@pythonExpression

" }}}
" Lambda: {{{
syn keyword pythonStatement lambda nextgroup=pythonLambdaParameter skipwhite
syn match pythonLambdaParameter '\h\w*\%(\i*\.\|\i*\s*(\)\@!\s*\ze:' contained

" }}}
" Comment: {{{
syn match pythonComment '#.*$' display contains=pythonTodo,@Spell
syn keyword pythonTodo FIXME NOTE TODO XXX contained

" }}}
" Boolean: {{{
syn keyword pythonBoolean True False
syn keyword pythonNone None

" }}}
" String: {{{
" -----------------------------------------------------------------------------
syn region pythonBytes start=+[bB]'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonBytesError,pythonBytesContent,@Spell
syn region pythonBytes start=+[bB]"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonBytesError,pythonBytesContent,@Spell
syn region pythonBytes start=+[bB]'''+ skip=+\\'+ end=+'''+ keepend contains=pythonBytesError,pythonBytesContent,pythonDocTest,pythonSpaceError,@Spell
syn region pythonBytes start=+[bB]"""+ skip=+\\"+ end=+"""+ keepend contains=pythonBytesError,pythonBytesContent,pythonDocTest2,pythonSpaceError,@Spell

syn match pythonBytesError    '.\+' display contained
syn match pythonBytesContent  '[\u0000-\u00ff]\+' display contained contains=pythonEscape,pythonEscapeError

syn match pythonEscape +\\[abfnrtv'"\\]+ display contained
syn match pythonEscape '\\\o\o\=\o\=' display contained
syn match pythonEscapeError '\\\o\{,2}[89]' display contained
syn match pythonEscape '\\x\x\{2}' display contained
syn match pythonEscapeError '\\x\x\=\X' display contained
syn match pythonEscape '\\$'
syn match pythonUniEscape '\\u\x\{4}' display contained
syn match pythonUniEscapeError '\\u\x\{,3}\X' display contained
syn match pythonUniEscape '\\U\x\{8}' display contained
syn match pythonUniEscapeError '\\U\x\{,7}\X' display contained
syn match pythonUniEscape '\\N{[A-Z ]\+}' display contained
syn match pythonUniEscapeError '\\N{[^A-Z ]\+}' display contained

syn region pythonString start=+'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonEscape,pythonEscapeError,pythonUniEscape,pythonUniEscapeError,@Spell
syn region pythonString start=+"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonEscape,pythonEscapeError,pythonUniEscape,pythonUniEscapeError,@Spell
syn region pythonString start=+'''+ skip=+\\'+ end=+'''+ keepend contains=pythonEscape,pythonEscapeError,pythonUniEscape,pythonUniEscapeError,pythonDocTest,pythonSpaceError,@Spell
syn region pythonString start=+"""+ skip=+\\"+ end=+"""+ keepend contains=pythonEscape,pythonEscapeError,pythonUniEscape,pythonUniEscapeError,pythonDocTest2,pythonSpaceError,@Spell

syn region pythonFString start=+[fF]'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonEscape,pythonEscapeError,pythonUniEscape,pythonUniEscapeError,@Spell
syn region pythonFString start=+[fF]"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonEscape,pythonEscapeError,pythonUniEscape,pythonUniEscapeError,@Spell
syn region pythonFString start=+[fF]'''+ skip=+\\'+ end=+'''+ keepend contains=pythonEscape,pythonEscapeError,pythonUniEscape,pythonUniEscapeError,pythonDocTest,pythonSpaceError,@Spell
syn region pythonFString start=+[fF]"""+ skip=+\\"+ end=+"""+ keepend contains=pythonEscape,pythonEscapeError,pythonUniEscape,pythonUniEscapeError,pythonDocTest2,pythonSpaceError,@Spell

syn region pythonRawString start=+[rR]'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonRawEscape,@Spell
syn region pythonRawString start=+[rR]"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonRawEscape,@Spell
syn region pythonRawString start=+[rR]'''+ skip=+\\'+ end=+'''+ keepend contains=pythonDocTest,pythonSpaceError,@Spell
syn region pythonRawString start=+[rR]"""+ skip=+\\"+ end=+"""+ keepend contains=pythonDocTest2,pythonSpaceError,@Spell
syn region pythonRawFString start=+\%([fF][rR]\|[rR][fF]\)'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonRawEscape,@Spell
syn region pythonRawFString start=+\%([fF][rR]\|[rR][fF]\)"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonRawEscape,@Spell
syn region pythonRawFString start=+\%([fF][rR]\|[rR][fF]\)'''+ skip=+\\'+ end=+'''+ keepend contains=pythonDocTest,pythonSpaceError,@Spell
syn region pythonRawFString start=+\%([fF][rR]\|[rR][fF]\)"""+ skip=+\\"+ end=+"""+ keepend contains=pythonDocTest,pythonSpaceError,@Spell
syn region pythonRawBytes start=+\%([bB][rR]\|[rR][bB]\)'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonRawEscape,@Spell
syn region pythonRawBytes start=+\%([bB][rR]\|[rR][bB]\)"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonRawEscape,@Spell
syn region pythonRawBytes start=+\%([bB][rR]\|[rR][bB]\)'''+ skip=+\\'+ end=+'''+ keepend contains=pythonDocTest,pythonSpaceError,@Spell
syn region pythonRawBytes start=+\%([bB][rR]\|[rR][bB]\)"""+ skip=+\\"+ end=+"""+ keepend contains=pythonDocTest2,pythonSpaceError,@Spell

syn match pythonRawEscape +\\['"]+ display contained

syn match pythonStrFormatting '%\%(([^)]\+)\)\=[-#0 +]*\d*\%(\.\d\+\)\=[hlL]\=[diouxXeEfFgGcrs%]' contained containedin=pythonString,pythonRawString,pythonBytesContent
syn match pythonStrFormatting '%[-#0 +]*\%(\*\|\d\+\)\=\%(\.\%(\*\|\d\+\)\)\=[hlL]\=[diouxXeEfFgGcrs%]' contained containedin=pythonString,pythonRawString,pythonBytesContent
syn match pythonStrFormat "{\%(\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\|\d\+\)\=\%(\.\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\|\[\%(\d\+\|[^!:\}]\+\)\]\)*\%(![rsa]\)\=\%(:\%({\%(\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\|\d\+\)}\|\%([^}]\=[<>=^]\)\=[ +-]\=#\=0\=\d*,\=\%(\.\d\+\)\=[bcdeEfFgGnosxX%]\=\)\=\)\=}" contained containedin=pythonString,pythonRawString
syn region pythonStrInterpRegion start="{"he=e+1,rs=e+1 end="\%(![rsa]\)\=\%(:\%({\%(\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\|\d\+\)}\|\%([^}]\=[<>=^]\)\=[ +-]\=#\=0\=\d*,\=\%(\.\d\+\)\=[bcdeEfFgGnosxX%]\=\)\=\)\=}"hs=s-1,re=s-1 extend contained containedin=pythonFString,pythonRawFString contains=pythonStrInterpRegion,pythonFunctionCall,@pythonExpression
syn match pythonStrFormat "{{\|}}" contained containedin=pythonString,pythonRawString,pythonFString,pythonRawFString

syn match pythonStrTemplate '\$\$' contained containedin=pythonString,pythonRawString
syn match pythonStrTemplate '\${[a-zA-Z_][a-zA-Z0-9_]*}' contained containedin=pythonString,pythonRawString
syn match pythonStrTemplate '\$[a-zA-Z_][a-zA-Z0-9_]*' contained containedin=pythonString,pythonRawString

syn region pythonDocTest start='^\s*>>>' skip=+\\'+ end=+'''+he=s-1 end='^\s*$' contained
syn region pythonDocTest2 start='^\s*>>>' skip=+\\"+ end=+"""+he=s-1 end='^\s*$' contained

" }}}
" Number: {{{
" -----------------------------------------------------------------------------
syn match pythonOctError '\<0[oO]\=\o*\D\+\d*\>' display
" pythonHError comes after pythonOctError so that 0xffffl is pythonHexError
syn match pythonHexError '\<0[xX]\x*[g-zG-Z]\x*\>' display
syn match pythonBinError '\<0[bB][01]*\D\+\d*\>' display

syn match pythonHexNumber '\<0[xX][_0-9a-fA-F]*\x\>' display
syn match pythonOctNumber '\<0[oO][_0-7]*\o\>' display
syn match pythonBinNumber '\<0[bB][_01]*[01]\>' display

syn match pythonNumberError '\<\d[_0-9]*\D\>' display
syn match pythonNumberError '\<0[_0-9]\+\>' display
syn match pythonNumberError '\<0_x\S*\>' display
syn match pythonNumberError '\<0[bBxXoO][_0-9a-fA-F]*_\>' display
syn match pythonNumberError '\<\d[_0-9]*_\>' display
syn match pythonNumber '\<\d\>' display
syn match pythonNumber '\<[1-9][_0-9]*\d\>' display
syn match pythonNumber '\<\d[jJ]\>' display
syn match pythonNumber '\<[1-9][_0-9]*\d[jJ]\>' display

syn match pythonOctError '\<0[oO]\=\o*[8-9]\d*\>' display
syn match pythonBinError '\<0[bB][01]*[2-9]\d*\>' display

syn match pythonFloat '\.\d\%([_0-9]*\d\)\=\%([eE][+-]\=\d\%([_0-9]*\d\)\=\)\=[jJ]\=\>' display
syn match pythonFloat '\<\d\%([_0-9]*\d\)\=[eE][+-]\=\d\%([_0-9]*\d\)\=[jJ]\=\>' display
syn match pythonFloat '\<\d\%([_0-9]*\d\)\=\.\d\=\%([_0-9]*\d\)\=\%([eE][+-]\=\d\%([_0-9]*\d\)\=\)\=[jJ]\=' display

" }}}
" Builtin: {{{
if !exists("python_no_builtin_highlight")
    " builtin functions
    let s:builtin_funcs='__import__|abs|all|any|bin|callable|cmp|compile|delattr|dir|divmod|enumerate|eval|filter|exec|format|getattr|globals|locals|hasattr|hash|help|hex|id|input|intern|isinstance|issubclass|iter|len|map|max|min|range|next|oct|open|ord|pow|reduce|reload|repr|reversed|round|setattr|sorted|sum|vars|zip|print|chr|memoryview|ascii|__init__|breakpoint'
    let s:builtin_funcs='syn match pythonBuiltinFunc ''\v\.@<!\zs<%(' . s:builtin_funcs . ')>'
    let s:builtin_funcs .= '\=@!'
    execute s:builtin_funcs . ''''
    unlet s:builtin_funcs

    " builtin objects
    let s:builtin_obj='NotImplemented|Ellipsis|complex|float|int|list|slice|bool|str|dict|frozenset|set|tuple|type|object|bytes|bytearray|classmethod|staticmethod|property|super|None|__doc__|__debug__|__file__|__name__|__package__|__loader__|__spec__|__path__|__cached__'
    execute 'syn match pythonBuiltinObj ''\v\.@<!\zs<%(' . s:builtin_obj . ')>'''
    unlet s:builtin_obj
endif
" }}}
" Exception: {{{
if !exists("python_no_exception_highlight")
    let s:exs='|BaseException|Exception|ArithmeticError|BufferError|LookupError|AssertionError|AttributeError|EOFError|FloatingPointError|GeneratorExit|ImportError|IOError|IndentationError|IndexError|KeyError|KeyboardInterrupt|MemoryError|NameError|NotImplementedError|OSError|OverflowError|ReferenceError|RuntimeError|StopIteration|SyntaxError|SystemError|SystemExit|TabError|UnboundLocalError|UnicodeError|UnicodeDecodeError|UnicodeEncodeError|UnicodeTranslateError|ValueError|ZeroDivisionError|Warning|UserWarning|BytesWarning|DeprecationWarning|PendingDeprecationWarning|SyntaxWarning|RuntimeWarning|FutureWarning|ImportWarning|UnicodeWarning|BlockingIOError|ChildProcessError|ConnectionError|BrokenPipeError|ConnectionAbortedError|ConnectionRefusedError|ConnectionResetError|FileExistsError|FileNotFoundError|InterruptedError|IsADirectoryError|NotADirectoryError|PermissionError|ProcessLookupError|TimeoutError|StopAsyncIteration|ResourceWarning'
    execute 'syn match pythonException ''\v\.@<!\zs<%(' . s:exs . ')>'''
    unlet s:exs
endif

" }}}
" Expression: {{{
syn cluster pythonExpression contains=pythonStatement,pythonRepeat,pythonConditional,pythonDot,pythonOperator,pythonNumber,pythonHexError,pythonOctNumber,pythonBinNumber,pythonFloat,pythonString,pythonFString,pythonBytes,pythonBoolean,pythonNone,pythonBuiltinObj,pythonBuiltinFunc,pythonBuiltinType,pythonComment,pythonSelf


" }}}
" Colon: {{{
syn match pythonColon ':'

" }}}
" Highlighting: {{{
" -----------------------------------------------------------------------------
" Sync at the beginning of class, function or method definition
" syn sync match pythonSync grouphere NONE "^\s*\%(def\|class\)\s\+\h\w*\s*("
syn sync match pythonSync grouphere NONE '):$'
hi def link pythonStatement Statement
hi def link pythonConditional Conditional
hi def link pythonRepeat Repeat
hi def link pythonException Exception
hi def link pythonOperator Statement
hi def link pythonAsync pythonStatement
hi def link pythonSelf StorageClass
hi def link pythonInclude Include
hi def link pythonDecorator Decorators
" hi def link pythonDottedName Function
hi def link pythonClass pythonClass
hi def link pythonFunction Function
hi def link pythonFunctionCall pythonFunction
hi def link pythonFunctionParameter Type
hi def link pythonLambdaParameter pythonFunctionParameter
hi def link pythonFunctionKeyword pythonFunctionParameter
hi def link pythonTypeHint pythonFunctionParameter
hi def link pythonComment Comment
hi def link pythonTodo Todo
hi def link pythonBoolean Number
hi def link pythonNone pythonBoolean

hi def link pythonBuiltinObj StorageClass
hi def link pythonBuiltinFunc Function

hi def link pythonString String
hi def link pythonRawString pythonString
hi def link pythonRawEscape Special
hi def link pythonUniEscape Special
hi def link pythonUniEscapeError Error
hi def link pythonBytes pythonString
hi def link pythonRawBytes pythonString
hi def link pythonBytesContent pythonString
hi def link pythonBytesError Error
hi def link pythonEscape Special
hi def link pythonEscapeError Error
hi def link pythonFString pythonString
hi def link pythonRawFString pythonString
" hi def link pythonStrInterpRegion Special

hi def link pythonStrFormatting Special
hi def link pythonStrFormat Special
hi def link pythonStrTemplate Special
hi def link pythonDocTest Special
hi def link pythonDocTest2 Special

hi def link pythonNumber Number
hi def link pythonHexNumber Number
hi def link pythonOctNumber Number
hi def link pythonBinNumber Number
hi def link pythonFloat Float
hi def link pythonNumberError Error
hi def link pythonOctError Error
hi def link pythonHexError Error
hi def link pythonBinError Error

hi def link pythonColon Delimiter

let b:current_syntax="python"
let &cpo=s:cpo_save
unlet s:cpo_save

" }}}
" vim: set sw=4 ts=4 sts=4 et tw=80 ft=vim fdm=marker

