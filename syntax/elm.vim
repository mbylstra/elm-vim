" syntax highlighting for Elm (http://elm-lang.org/)

if exists('b:current_syntax')
  finish
endif

syn keyword elmReservedWord as let in port case of if then else
syn keyword elmHtmlElement div ul li span p a button table tr td th thead tbody dl dd dt header aside article h1 h2 h3 h4 h5 h6 hr pre blockquote code em strong sub sup ol img iframe input textarea select option section nav footer address main_ body figure figurecaption caption colgroup col tfoot fieldset legend label datalist optgroup keygen cite dfn abbr text

" Comments
syn keyword elmTodo TODO FIXME XXX contained
syn match elmLineComment "--.*" contains=elmTodo,@spell

" Strings
syn match elmStringEscape "\\u[0-9a-fA-F]\{4}" contained
syn match elmStringEscape "\\[nrfvbt\\\"]" contained
syn region elmString start="\"" skip="\\\"" end="\"" contains=elmStringEscape,@spell
syn region elmTripleString start="\"\"\"" skip="\\\"" end="\"\"\"" contains=elmStringEscape,@spell
syn match elmChar "'[^'\\]'\|'\\.'\|'\\u[0-9a-fA-F]\{4}'"

" Numbers
syn match elmInt "-\?\<\d\+\>\|0[xX][0-9a-fA-F]\+\>"
syn match elmFloat "\(\<\d\+\.\d\+\>\)"

syn match elmValueConstructor "\v<[A-Z][a-zA-Z0-9_]*" contained
syn match elmVariable "\v[ \.][a-z][a-zA-Z0-9_]*" contained

syn match elmInfixFunction "\v\|\>|\<\||\>\>|\<\<|\+\+|\=\=|\/\=|\<\=|\>\=|\<|\>|\&\&|\|\||\+|\-|\*|\/|\^|\/\/|\%|\!|\(\+\+\)|\:\:"
syn match elmFunctionDefinitionSymbols "\v(\-\>|\\)" contained
syn match elmViewFunction "\v<\w*[vV]iew\w*>"
syn region elmFunctionDefinition  matchgroup=elmFunctionDefinitionName start="[a-z].*=" end="\v^([a-z-{])@=" contains=elmInt,elmString,elmHtmlElement,elmReservedWord,elmInfixFunction,elmFunctionDefinitionSymbols,elmLineComment,elmComment,elmValueConstructor,elmModuleQualifier,elmViewFunction
syn match elmTypeVariable "\v<[a-z][a-zA-Z0-9_]*" contained
syn match elmType "\v<[A-Z][a-zA-Z0-9_]*" contained
syn match elmModuleQualifier "\v<[A-Z][a-zA-Z0-9_]*\." contained


syn match elmFunctionNameInFunctionDeclaration "^[a-z][a-zA-Z0-9_]*" contained
syn region elmFunctionDeclaration start="\v^[a-z][a-zA-Z0-9_]* :" end="\v^([a-z-{])@=" contains=elmTypeVariable,elmFunctionNameInFunctionDeclaration,elmModuleQualifier,elmRecordDeclaration,elmExtensibleRecordDeclaration,elmType

syn match elmTypeDeclarationSymbols "[|=]"
syn match elmTypeKeyword "^type" contained
syn match elmValueConstructorDeclaration "\v[\=\|] [A-Z][a-zA-Z0-9_]*" contained contains=elmTypeDeclarationSymbols
syn region elmTypeDeclaration start="^type [A-Z]" end="\v^([a-z-{])@=" contains=elmType,elmTypeKeyword,elmTypeVariable,elmValueConstructorDeclaration,elmLineComment,elmTypeDeclarationSymbols,elmModuleQualifier,elmRecordDeclaration,elmExtensibleRecordDeclaration

syn match elmExposedValueConstructor "\v[A-Z][a-zA-Z0-9_]*" contained
syn match elmExposedType "\v[A-Z][a-zA-Z0-9_]*" contained
syn match elmExposedFunction "\v[a-z][a-zA-Z0-9_]*" contained
syn match elm "\v[A-Z][a-zA-Z0-9_]*" contained
syn region elmExposedValueConstructors start="(" end=")" contained contains=elmExposedValueConstructor,elmWildcardImportExport
syn region elmExposedNames matchgroup=elmExposedNamesBrackets start=/(/ end=/)/ contained contains=elmExposedValueConstructors,elmExposedType,elmExposedFunction,elmWildcardImportExport
syn match elmModuleName "\v[A-Z][a-zA-Z0-9_\.]*" contained
syn region elmImportStatement start="^import" end="\v^([a-z-{])@=" contains=elmModuleName,elmExposedNames,elmLineComment

syn match elmCurrentModuleName "\v[A-Z][a-zA-Z0-9_\.]*" contained
syn region elmModuleStatement start="^module" end="\v^([a-z-{])@=" contains=elmCurrentModuleName,elmExposedNames,elmLineComment,elmWildcardImportExport

syn match elmWildcardImportExport "\.\." contained

syn region elmTypeAliasDeclaration matchgroup=elmTypeAliasKeywords start="^type alias" end="\v^([a-z-{])@=" contains=elmExtensibleRecordDeclaration,elmRecordDeclaration,elmType,elmTypeVariable

syn region elmExtensibleRecordDeclaration matchgroup=elmExtensibleRecordDeclarationBrackets start="\v\{ [a-z][a-zA-Z0-9_]*" end="}" contains=elmExtensibleRecordDeclaration,elmRecordDeclaration,fieldNameDeclaration,elmComment,elmLineComment,elmType,elmModuleQualifier,elmRecordDeclarationSymbols contained
syn region elmRecordDeclaration matchgroup=elmRecordDeclarationBrackets start="\v\{ [a-z][a-zA-Z0-9_]* :" end="}" contains=elmRecordDeclaration,fieldNameDeclaration,elmType,elmModuleQualifier,elmDelimiter,elmComment,elmLineComment,elmRecordDeclarationSymbols contained

syn match fieldNameDeclaration "[a-z][a-zA-Z0-9_]* :" contained


" Delimiters
syn match elmDelimiter  "[,;]" 
syn match elmRoundBrackets "[()]" contained
syn match elmRoundBrackets "[()]"

syn match elmRecordDeclarationSymbols "\v[\,\(\)\-\>]"

syn region elmComment matchgroup=elmComment start="{-|\=" end="-}" contains=elmTodo,elmComment,@spell
syn match elmLineComment "--.*" contains=elmTodo,@spell

" hi def link elmTopLevelDecl Function
" hi def link elmTupleFunction Normal
" hi def link elmTodo Todo
hi def link elmComment Comment
hi def link elmLineComment Comment
hi def link elmString String
hi def link elmTripleString String
hi def link elmChar String
hi def link elmStringEscape Special
hi def link elmInt Number
hi def link elmFloat Float
hi def link elmDelimiter Delimiter
hi def link elmBraces Delimiter
" hi def link elmTypedef TypeDef
" hi def link elmLetIn Delimiter
" hi def link elmImport Include
" hi def link elmConditional Conditional
" hi def link elmAlias Delimiter
" hi def link elmOperator Operator
" hi def link elmValueConstructor Identifier
" hi def link elmModuleQualifier Identifier
" hi def link elmNumberType Identifier
" hi def link elmTest Special
"

hi def link elmFunctionDeclaration Include
hi def link elmTypeVariable Special
hi def link elmType TypeDef

syn sync minlines=500

let b:current_syntax = 'elm'
