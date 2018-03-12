" syntax highlighting for elm make output

if exists('b:current_syntax')
  finish
endif

set conceallevel=2


" Errors
syntax match elmMakeErrors "\v^\=+ ERRORS \=+"
syntax match elmMakeError "\v^\-+ .* \-+"
" syntax keyword elmMakeTypo typos typo
syntax match elmFindModuleError "\v^I cannot find module"

highlight link elmMakeError WarningMsg
highlight link elmMakeErrors WarningMsg
" highlight link elmMakeTypo WarningMsg
highlight link elmFindModuleError WarningMsg

" Warnings

syntax match elmMakeWarnings "\v^\=+ WARNINGS \=+"
syntax match elmMakeImportWarning "\v^\-+ unused import \-+"
syntax match elmMakeAnnotationWarning "\v^\-+ missing type annotation \-+"

highlight link elmMakeWarnings Number
highlight link elmMakeImportWarning Number
highlight link elmMakeAnnotationWarning Number

" Misc
syntax match elmMakeSuccess "\v^Success!"
syntax match elmMakeHide "\v^Successfully generated .*" conceal
syntax match elmMakeNumErrors "\v^Detected errors .*"
syntax match elmMakeColumnIndicator "\v\^" 
syntax match elmMakeDirectory "\v(\w+\/)+"
syntax match elmMakeHint "\vHint\:"
" syntax match elmLineNumber "\v^([0-9]+)\|.*"
syntax match elmLineIndicator "\v^([0-9]+)\|\>.*"

syntax match elmFoo "\v(foo)@<=bar"
highlight link elmFoo String

highlight link elmMakeSuccess String
highlight link elmMakeNumErrors Comment
highlight link elmMakeColumnIndicator Type
highlight link elmMakeDirectory Comment
" highlight link elmLineNumber Comment
highlight link elmLineIndicator Type

" Hints
"
syntax region elmMakeHintBody matchgroup=elmMakeHint start="\v^Hint:" end="^$"
highlight link elmMakeHint Function
highlight link elmMakeHintBody Comment

syntax region elmMakeSingleLineSnippet
\ matchgroup=elmMakeSingleLineSnippetStartEnd 
\ start="\vCannot find type" 
\ end="\v(No module called|Maybe you want one of the following|--|Detected errors)@=" 
\ contains=elmMakeSingleLineNumber,elmMakeColumnIndicator,elmMakeUnknownType,elmMakeType,elmMakeModuleQualifier
syntax match elmMakeSingleLineNumber "\v^[0-9]+" contained
syntax match elmMakeType "\v<[A-Z][a-zA-Z0-9_]*" contained
syntax match elmMakeModuleQualifier "\v<[A-Z][a-zA-Z0-9_]*\." contained
highlight link elmMakeSingleLineNumber Type
highlight link elmMakeSingleLineSnippetStartEnd Normal
highlight link elmMakeType Function


syntax match elmFile "\v\w+\.elm"
highlight link elmFile Type

" syn match elmMakeInfixFunction "\v\|\>|\<\||\>\>|\<\<|\+\+|\=\=|\/\=|\<\=|\>\=|\&\&|\|\||\+|\*|\/|\^|\/\/|\%|\!|\(\+\+\)|\:\:"
" highlight link  elmMakeInfixFunction Statement

syn sync minlines=500

let b:current_syntax = 'elmmakeoutput'


	" *Comment	any comment
    "
	" *Constant	any constant
	"  String		a string constant: "this is a string"
	"  Character	a character constant: 'c', '\n'
	"  Number		a number constant: 234, 0xff
	"  Boolean	a boolean constant: TRUE, false
	"  Float		a floating point constant: 2.3e10
    "
	" *Identifier	any variable name
	"  Function	function name (also: methods for classes)
    "
	" *Statement	any statement
	"  Conditional	if, then, else, endif, switch, etc.
	"  Repeat		for, do, while, etc.
	"  Label		case, default, etc.
	"  Operator	"sizeof", "+", "*", etc.
	"  Keyword	any other keyword
	"  Exception	try, catch, throw
    "
	" *PreProc	generic Preprocessor
	"  Include	preprocessor #include
	"  Define		preprocessor #define
	"  Macro		same as Define
	"  PreCondit	preprocessor #if, #else, #endif, etc.
    "
	" *Type		int, long, char, etc.
	"  StorageClass	static, register, volatile, etc.
	"  Structure	struct, union, enum, etc.
	"  Typedef	A typedef
    "
	" *Special	any special symbol
	"  SpecialChar	special character in a constant
	"  Tag		you can use CTRL-] on this
	"  Delimiter	character that needs attention
	"  SpecialComment	special things inside a comment
	"  Debug		debugging statements
    "
	" *Underlined	text that stands out, HTML links
    "
	" *Ignore		left blank, hidden  |hl-Ignore|
    "
	" *Error		any erroneous construct
    "
	" *Todo		anything that needs extra attention; mostly the
	"         keywords TODO FIXME and XXX
