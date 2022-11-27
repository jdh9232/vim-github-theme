" Vim Github Light (color scheme)
" https://github.com/akiicat/vim-github-light

scriptencoding utf-8

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="github_dark"

" Highlighting function (inspiration from https://github.com/chriskempson/base16-vim)
if &t_Co >= 256
    let g:github_term256=1
elseif !exists("g:github_term256")
    let g:github_term256=0
endif
fun! <sid>hi(group, fg, bg, attr, sp)
  if !empty(a:fg)
    exec "hi " . a:group . " guifg=" . a:fg.gui . " ctermfg=" . (g:github_term256 ? a:fg.cterm256 : a:fg.cterm)
  endif
  if !empty(a:bg)
    exec "hi " . a:group . " guibg=" . a:bg.gui . " ctermbg=" . (g:github_term256 ? a:bg.cterm256 : a:bg.cterm)
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
  endif
  if !empty(a:sp)
    exec "hi " . a:group . " guisp=" . a:sp.gui
  endif
endfun

" ------------------
" Color definitions:
" ------------------

" Terminal colors (base16):
let s:cterm00 = "00"
let s:cterm03 = "08"
let s:cterm05 = "07"
let s:cterm07 = "15"
let s:cterm08 = "01"
let s:cterm0A = "03"
let s:cterm0B = "02"
let s:cterm0C = "06"
let s:cterm0D = "04"
let s:cterm0E = "05"
if exists('base16colorspace') && base16colorspace == "256"
  let s:cterm01 = "18"
  let s:cterm02 = "19"
  let s:cterm04 = "20"
  let s:cterm06 = "21"
  let s:cterm09 = "16"
  let s:cterm0F = "17"
else
  let s:cterm01 = "00"
  let s:cterm02 = "08"
  let s:cterm04 = "07"
  let s:cterm06 = "07"
  let s:cterm09 = "06"
  let s:cterm0F = "03"
endif

" General appearance colors:
" (some of them may be unused)

" Transparent background
if !exists("g:github_transparent")
    let g:github_transparent=0
endif

let s:cdNone     = {'gui': 'NONE',    'cterm': 'NONE',    'cterm256': 'NONE'}
let s:cdFront    = {'gui': '#C9D1D9', 'cterm': s:cterm00, 'cterm256': '235'}
let s:cdBack     = {'gui': '#0D1117', 'cterm': s:cterm0F, 'cterm256': '15'}
if g:github_transparent | let s:cdBack = {'gui': 'NONE', 'cterm': 'NONE', 'cterm256': 'NONE'} | endif

let s:cdTabCurrent = {'gui': '#1E1E1E', 'cterm': s:cterm00, 'cterm256': '234'}
let s:cdTabOther = {'gui': '#2D2D2D', 'cterm': s:cterm01, 'cterm256': '236'}
let s:cdTabOutside = {'gui': '#252526', 'cterm': s:cterm01, 'cterm256': '235'}

let s:cdLeftDark = {'gui': '#222222', 'cterm': s:cterm01, 'cterm256': '235'}
let s:cdLeftMid = {'gui': '#373737', 'cterm': s:cterm03, 'cterm256': '237'}
let s:cdLeftLight = {'gui': '#8A8A8A', 'cterm': s:cterm03, 'cterm256': '245'}

let s:cdPopupFront = {'gui': '#BBBBBB', 'cterm': s:cterm06, 'cterm256': '250'}
let s:cdPopupBack = {'gui': '#2D2D30', 'cterm': s:cterm01, 'cterm256': '236'}
let s:cdPopupHighlightBlue = {'gui': '#073655', 'cterm': s:cterm0D, 'cterm256': '24'}
let s:cdPopupHighlightGray = {'gui': '#3D3D40', 'cterm': s:cterm03, 'cterm256': '237'}

let s:cdSplitLight = {'gui': '#898989', 'cterm': s:cterm04, 'cterm256': '245'}
let s:cdSplitDark = {'gui': '#444444', 'cterm': s:cterm03, 'cterm256': '238'}
let s:cdSplitThumb = {'gui': '#424242', 'cterm': s:cterm04, 'cterm256': '238'}

let s:cdCursorDarkDark = {'gui': '#252526', 'cterm': s:cterm01, 'cterm256': '235'}
let s:cdCursorDark = {'gui': '#51504F', 'cterm': s:cterm03, 'cterm256': '239'}
let s:cdCursorLight = {'gui': '#AEAFAD', 'cterm': s:cterm04, 'cterm256': '145'}
let s:cdSelection = {'gui': '#264F78', 'cterm': s:cterm03, 'cterm256': '24'}
let s:cdLineNumber = {'gui': '#5A5A5A', 'cterm': s:cterm04, 'cterm256': '240'}

let s:cdDiffRedDark = {'gui': '#301A1F', 'cterm': s:cterm0F, 'cterm256': '52'}
let s:cdDiffRedLight = {'gui': '#542426', 'cterm': s:cterm0F, 'cterm256': '52'}
let s:cdDiffGreenDark = {'gui': '#12261E', 'cterm': s:cterm0B, 'cterm256': '22'}
let s:cdDiffGreenLight = {'gui': '#1C4428', 'cterm': s:cterm09, 'cterm256': '22'}
let s:cdDiffBlueLight = {'gui': '#1E4273', 'cterm': s:cterm0F, 'cterm256': '17'}
let s:cdDiffBlueDark = {'gui': '#13233A', 'cterm': s:cterm0B, 'cterm256': '25'}

let s:cdSearchCurrent = {'gui': '#4B5632', 'cterm': s:cterm09, 'cterm256': '238'}
let s:cdSearch = {'gui': '#264F78', 'cterm': s:cterm03, 'cterm256': '24'}

" Syntax colors:

if !exists("g:github_conservative")
    let g:github_conservative=0
endif

" Italicized comments
if !exists("g:github_italics")
    let g:github_italics=0
endif

let s:cdPurple   = {'gui': '#D2A8FF', 'cterm': s:cterm05, 'cterm256': '98'}
let s:cdBlue     = {'gui': '#79C0FF', 'cterm': s:cterm04, 'cterm256': '25'}
let s:cdDarkBlue = {'gui': '#A5D6FF', 'cterm': s:cterm04, 'cterm256': '23'}
let s:cdGreen    = {'gui': '#7EE787', 'cterm': s:cterm06, 'cterm256': '22'}
let s:cdRed      = {'gui': '#FF7B72', 'cterm': s:cterm01, 'cterm256': '160'}
let s:cdRedDark  = {'gui': '#FFDCD7', 'cterm': s:cterm01, 'cterm256': '1'}
let s:cdOrange   = {'gui': '#FFA657', 'cterm': s:cterm01, 'cterm256': '94'}
let s:cdBrown    = {'gui': '#FFA657', 'cterm': s:cterm01, 'cterm256': '94'}
let s:cdGray     = {'gui': '#8B949E', 'cterm': s:cterm08, 'cterm256': '243'}

" Vim editor colors
"    <sid>hi(GROUP, FOREGROUND, BACKGROUND, ATTRIBUTE, SPECIAL)
call <sid>hi('Normal', s:cdFront, s:cdBack, 'none', {})
call <sid>hi('ColorColumn', {}, s:cdLeftDark, 'none', {})
call <sid>hi('Cursor', s:cdCursorDark, s:cdCursorLight, 'none', {})
call <sid>hi('CursorLine', {}, s:cdCursorDarkDark, 'none', {})
call <sid>hi('CursorColumn', {}, s:cdCursorDarkDark, 'none', {})
call <sid>hi('Directory', s:cdBlue, s:cdNone, 'none', {})
call <sid>hi('DiffAdd', s:cdNone, s:cdDiffGreenLight, 'none', {})
call <sid>hi('DiffChange', s:cdNone, s:cdDiffBlueLight, 'none', {})
call <sid>hi('DiffDelete', s:cdDiffRedLight, s:cdDiffRedLight, 'none', {})
call <sid>hi('DiffText', s:cdNone, s:cdDiffBlueDark, 'none', {})
call <sid>hi('EndOfBuffer', s:cdLineNumber, s:cdBack, 'none', {})
call <sid>hi('ErrorMsg', s:cdRed, s:cdBack, 'none', {})
call <sid>hi('VertSplit', s:cdSplitDark, s:cdBack, 'none', {})
call <sid>hi('Folded', s:cdLeftLight, s:cdLeftDark, 'none', {})
call <sid>hi('FoldColumn', s:cdLineNumber, s:cdBack, 'none', {})
call <sid>hi('SignColumn', {}, s:cdBack, 'none', {})
call <sid>hi('IncSearch', s:cdNone, s:cdSearchCurrent, 'none', {})
call <sid>hi('LineNr', s:cdLineNumber, s:cdBack, 'none', {})
call <sid>hi('CursorLineNr', s:cdPopupFront, s:cdBack, 'none', {})
call <sid>hi('MatchParen', s:cdNone, s:cdCursorDark, 'none', {})
call <sid>hi('ModeMsg', s:cdFront, s:cdLeftDark, 'none', {})
call <sid>hi('MoreMsg', s:cdFront, s:cdLeftDark, 'none', {})
call <sid>hi('NonText', s:cdLineNumber, s:cdNone, 'none', {})
call <sid>hi('Pmenu', s:cdPopupFront, s:cdPopupBack, 'none', {})
call <sid>hi('PmenuSel', s:cdPopupFront, s:cdPopupHighlightBlue, 'none', {})
call <sid>hi('PmenuSbar', {}, s:cdPopupHighlightGray, 'none', {})
call <sid>hi('PmenuThumb', {}, s:cdPopupFront, 'none', {})
call <sid>hi('Question', s:cdBlue, s:cdBack, 'none', {})
call <sid>hi('Search', s:cdNone, s:cdSearch, 'none', {})
call <sid>hi('SpecialKey', s:cdBlue, s:cdNone, 'none', {})
call <sid>hi('StatusLine', s:cdFront, s:cdLeftMid, 'none', {})
call <sid>hi('StatusLineNC', s:cdFront, s:cdLeftDark, 'none', {})
call <sid>hi('TabLine', s:cdFront, s:cdTabOther, 'none', {})
call <sid>hi('TabLineFill', s:cdFront, s:cdTabOutside, 'none', {})
call <sid>hi('TabLineSel', s:cdFront, s:cdTabCurrent, 'none', {})
call <sid>hi('Title', s:cdNone, s:cdNone, 'bold', {})
call <sid>hi('Visual', s:cdNone, s:cdSelection, 'none', {})
call <sid>hi('VisualNOS', s:cdNone, s:cdSelection, 'none', {})
call <sid>hi('WarningMsg', s:cdOrange, s:cdBack, 'none', {})
call <sid>hi('WildMenu', s:cdNone, s:cdSelection, 'none', {})
call <sid>hi('netrwMarkFile', s:cdFront, s:cdSelection, 'none', {})

if !g:github_term256
    call <sid>hi('TabLineSel', s:cdBack, s:cdTabCurrent, 'none', {})
    call <sid>hi('WildMenu', s:cdBack, s:cdCursorDarkDark, 'none', {})
endif

" Legacy groups for official git.vim and diff.vim syntax
hi! link diffAdded DiffAdd
hi! link diffChanged DiffChange
hi! link diffRemoved DiffDelete

if g:github_italics | call <sid>hi('Comment', s:cdGray, {}, 'italic', {}) | else | call <sid>hi('Comment', s:cdGray, {}, 'none', {}) | endif

call <sid>hi('Constant', s:cdRed, {}, 'none', {})
call <sid>hi('String', s:cdDarkBlue, {}, 'none', {})
call <sid>hi('Character', s:cdBlue, {}, 'none', {})
call <sid>hi('Number', s:cdBlue, {}, 'none', {})
call <sid>hi('Boolean', s:cdBlue, {}, 'none', {})
call <sid>hi('Float', s:cdBlue, {}, 'none', {})

call <sid>hi('Identifier', s:cdBlue, {}, 'none', {})
call <sid>hi('Function', s:cdPurple, {}, 'none', {})

call <sid>hi('Statement', s:cdRed, {}, 'none', {})
call <sid>hi('Conditional', s:cdRed, {}, 'none', {})
call <sid>hi('Repeat', s:cdRed, {}, 'none', {})
call <sid>hi('Label', s:cdRed, {}, 'none', {})
call <sid>hi('Operator', s:cdRed, {}, 'none', {})
call <sid>hi('Keyword', s:cdRed, {}, 'none', {})
call <sid>hi('Exception', s:cdRed, {}, 'none', {})

call <sid>hi('PreProc', s:cdPurple, {}, 'none', {})
call <sid>hi('Include', s:cdRed, {}, 'none', {})
call <sid>hi('Define', s:cdPurple, {}, 'none', {})
call <sid>hi('Macro', s:cdPurple, {}, 'none', {})
call <sid>hi('PreCondit', s:cdPurple, {}, 'none', {})

call <sid>hi('Type', s:cdRed, {}, 'none', {})
call <sid>hi('StorageClass', s:cdRed, {}, 'none', {})
call <sid>hi('Structure', s:cdRed, {}, 'none', {})
call <sid>hi('Typedef', s:cdRed, {}, 'none', {})

call <sid>hi('Special', s:cdOrange, {}, 'none', {})
call <sid>hi('SpecialChar', s:cdBlue, {}, 'none', {})
call <sid>hi('Tag', s:cdFront, s:cdRed, 'none', {}) " ?
call <sid>hi('Delimiter', s:cdFront, {}, 'none', {})
if g:github_italics | call <sid>hi('SpecialComment', s:cdGray, {}, 'italic', {}) | else | call <sid>hi('SpecialComment', s:cdGray, {}, 'none', {}) | endif
call <sid>hi('Debug', s:cdFront, s:cdRed, 'none', {}) " ?

call <sid>hi('Underlined', s:cdNone, {}, 'underline', {})
call <sid>hi("Conceal", s:cdFront, s:cdBack, 'none', {})

call <sid>hi('Ignore', s:cdBack, s:cdRed, 'none', {}) "?

call <sid>hi('Error', s:cdRed, s:cdBack, 'undercurl', s:cdRed)

call <sid>hi('Todo', s:cdNone, s:cdLeftMid, 'none', {})

call <sid>hi('SpellBad', s:cdRed, s:cdBack, 'undercurl', s:cdRed)
call <sid>hi('SpellCap', s:cdRed, s:cdBack, 'undercurl', s:cdRed)
call <sid>hi('SpellRare', s:cdRed, s:cdBack, 'undercurl', s:cdRed)
call <sid>hi('SpellLocal', s:cdRed, s:cdBack, 'undercurl', s:cdRed)


" Markdown:
call <sid>hi('markdownH1', s:cdRed, {}, 'bold', {})
call <sid>hi('markdownH2', s:cdRed, {}, 'bold', {})
call <sid>hi('markdownH3', s:cdRed, {}, 'bold', {})
call <sid>hi('markdownH4', s:cdRed, {}, 'bold', {})
call <sid>hi('markdownH5', s:cdRed, {}, 'bold', {})
call <sid>hi('markdownH6', s:cdRed, {}, 'bold', {})
call <sid>hi('markdownBold', s:cdRed, {}, 'bold', {})
call <sid>hi('markdownCode', s:cdBlue, {}, 'none', {})
call <sid>hi('markdownRule', s:cdRed, {}, 'bold', {})
call <sid>hi('markdownCodeDelimiter', s:cdBlue, {}, 'none', {})
call <sid>hi('markdownHeadingDelimiter', s:cdRed, {}, 'none', {})
call <sid>hi('markdownFootnote', s:cdBlue, {}, 'none', {})
call <sid>hi('markdownFootnoteDefinition', s:cdBlue, {}, 'none', {})
call <sid>hi('markdownUrl', s:cdPurple, {}, 'underline', {})
call <sid>hi('markdownLinkText', s:cdBlue, {}, 'none', {})
call <sid>hi('markdownEscape', s:cdOrange, {}, 'none', {})

" Asciidoc (for default syntax highlighting)
call <sid>hi("asciidocAttributeEntry", s:cdOrange, {}, 'none', {})
call <sid>hi("asciidocAttributeList", s:cdPurple, {}, 'none', {})
call <sid>hi("asciidocAttributeRef", s:cdOrange, {}, 'none', {})
call <sid>hi("asciidocHLabel", s:cdRed, {}, 'bold', {})
call <sid>hi("asciidocListingBlock", s:cdBlue, {}, 'none', {})
call <sid>hi("asciidocMacroAttributes", s:cdOrange, {}, 'none', {})
call <sid>hi("asciidocOneLineTitle", s:cdRed, {}, 'bold', {})
call <sid>hi("asciidocPassthroughBlock", s:cdRed, {}, 'none', {})
call <sid>hi("asciidocQuotedMonospaced", s:cdBlue, {}, 'none', {})
call <sid>hi("asciidocTriplePlusPassthrough", s:cdBlue, {}, 'none', {})
call <sid>hi("asciidocMacro", s:cdPurple, {}, 'none', {})
call <sid>hi("asciidocAdmonition", s:cdBlue, {}, 'none', {})
call <sid>hi("asciidocQuotedEmphasized", s:cdRed, {}, 'italic', {})
call <sid>hi("asciidocQuotedEmphasized2", s:cdRed, {}, 'italic', {})
call <sid>hi("asciidocQuotedEmphasizedItalic", s:cdRed, {}, 'italic', {})
hi! link asciidocBackslash Keyword
hi! link asciidocQuotedBold markdownBold
hi! link asciidocQuotedMonospaced2 asciidocQuotedMonospaced
hi! link asciidocQuotedUnconstrainedBold asciidocQuotedBold
hi! link asciidocQuotedUnconstrainedEmphasized asciidocQuotedEmphasized
hi! link asciidocURL markdownUrl

" JSON:
call <sid>hi('jsonKeyword', s:cdGreen, {}, 'none', {})
call <sid>hi('jsonEscape', s:cdDarkBlue, {}, 'none', {})
call <sid>hi('jsonNull', s:cdBlue, {}, 'none', {})
call <sid>hi('jsonBoolean', s:cdBlue, {}, 'none', {})
call <sid>hi('jsonKeywordMatch', s:cdNone, {}, 'none', {})
call <sid>hi('jsonNoQuotesError', s:cdBack, s:cdRedDark, 'none', {})
call <sid>hi('jsonTrailingCommaError', s:cdBack, s:cdRedDark, 'none', {})
call <sid>hi('jsonMissingCommaError', s:cdBack, s:cdRedDark, 'none', {})

" YAML:
call <sid>hi('yamlBool', s:cdDarkBlue, {}, 'none', {})
call <sid>hi('yamlNull', s:cdDarkBlue, {}, 'none', {})
call <sid>hi('yamlPlainScalar', s:cdDarkBlue, {}, 'none', {})
call <sid>hi('yamlBlockMappingKey', s:cdGreen, {}, 'none', {})
call <sid>hi('yamlKeyValueDelimiter', s:cdNone, {}, 'none', {})
call <sid>hi('yamlBlockCollectionItemStart', s:cdDarkBlue, {}, 'none', {})

" HTML:
call <sid>hi('htmlTag', s:cdBlue, {}, 'none', {})
call <sid>hi('htmlTagN', s:cdGreen, {}, 'none', {})
call <sid>hi('htmlEndTag', s:cdFront, {}, 'none', {})
call <sid>hi('htmlTagName', s:cdGreen, {}, 'none', {})
call <sid>hi('htmlSpecialTagName', s:cdGreen, {}, 'none', {})
call <sid>hi('htmlArg', s:cdBlue, {}, 'none', {})
call <sid>hi('htmlH1', s:cdNone, {}, 'none', {})

" PHP: enable syntax plugin
call <sid>hi('phpStaticClasses', s:cdOrange, {}, 'none', {})
call <sid>hi('phpMethods ', s:cdPurple, {}, 'none', {})
call <sid>hi('phpClass', s:cdOrange, {}, 'none', {})
call <sid>hi('phpUseClass', s:cdNone, {}, 'none', {})
call <sid>hi('phpSuperglobals', s:cdBlue, {}, 'none', {})

" PHP: disable syntax plugin
call <sid>hi('phpFunctions', s:cdNone, {}, 'none', {})
call <sid>hi('phpInclude', s:cdRed, {}, 'none', {})
call <sid>hi('phpRegion', s:cdNone, {}, 'none', {})
call <sid>hi('phpMethodsVar', s:cdBlue, {}, 'none', {})
call <sid>hi('phpVarSelector', s:cdBlue, {}, 'none', {})
call <sid>hi('phpDefine', s:cdRed, {}, 'none', {})
call <sid>hi('phpRelation', s:cdNone, {}, 'none', {})
call <sid>hi('phpOperator', s:cdNone, {}, 'none', {})
call <sid>hi('phpMemberSelector', s:cdNone, {}, 'none', {})
call <sid>hi('phpIdentifier', s:cdNone, {}, 'none', {})
call <sid>hi('phpType', s:cdNone, {}, 'none', {})
call <sid>hi('phpComparison', s:cdNone, {}, 'none', {})

" CSS:
call <sid>hi('cssBraces', s:cdFront, {}, 'none', {})
call <sid>hi('cssInclude', s:cdRed, {}, 'none', {})
call <sid>hi('cssTagName', s:cdBlue, {}, 'none', {})
call <sid>hi('cssClassName', s:cdBlue, {}, 'none', {})
call <sid>hi('cssPseudoClass', s:cdBlue, {}, 'none', {})
call <sid>hi('cssPseudoClassId', s:cdBlue, {}, 'none', {})
call <sid>hi('cssPseudoClassLang', s:cdBlue, {}, 'none', {})
call <sid>hi('cssIdentifier', s:cdBlue, {}, 'none', {})
call <sid>hi('cssSelectorOp', s:cdBlue, {}, 'none', {})
call <sid>hi('cssProp', s:cdBlue, {}, 'none', {})
call <sid>hi('cssCustomProp', s:cdBlue, {}, 'none', {})
call <sid>hi('cssDefinition', s:cdBlue, {}, 'none', {})
call <sid>hi('cssAttr', s:cdFront, {}, 'none', {})
call <sid>hi('cssAttrRegion', s:cdFront, {}, 'none', {})
call <sid>hi('cssAttrComma', s:cdBlue, {}, 'none', {})
call <sid>hi('cssColor', s:cdFront, {}, 'none', {})
call <sid>hi('cssFunction', s:cdFront, {}, 'none', {})
call <sid>hi('cssVendor', s:cdFront, {}, 'none', {})
call <sid>hi('cssValueNumber', s:cdFront, {}, 'none', {})
call <sid>hi('cssValueLength', s:cdFront, {}, 'none', {})
call <sid>hi('cssUnitDecorators', s:cdFront, {}, 'none', {})
call <sid>hi('cssStyle', s:cdBlue, {}, 'none', {})
call <sid>hi('cssImportant', s:cdRed, {}, 'none', {})

" JavaScript:
call <sid>hi('jsFuncBlock', s:cdNone, {}, 'none', {})
call <sid>hi('jsThis', s:cdBlue, {}, 'none', {})
call <sid>hi('jsOperator', s:cdNone, {}, 'none', {})
call <sid>hi('jsUndefined', s:cdBlue, {}, 'none', {})
call <sid>hi('jsOperatorKeyword', s:cdRed, {}, 'none', {})
call <sid>hi('jsObjectProp', s:cdNone, {}, 'none', {})
call <sid>hi('jsArrowFunction', s:cdNone, {}, 'none', {})
call <sid>hi('jsClassDefinition', s:cdOrange, {}, 'none', {})
call <sid>hi('jsVariableDef', s:cdBlue, {}, 'none', {})
call <sid>hi('jsTemplateExpression', s:cdBlue, {}, 'none', {})

" JavaScript: no plugin
call <sid>hi('javaScriptBraces', s:cdNone, {}, 'none', {})
call <sid>hi('javaScriptFunction', s:cdRed, {}, 'none', {})


" " Typescript:
call <sid>hi('typescriptBraces', s:cdFront, {}, 'none', {})
call <sid>hi('typescriptEndColons', s:cdNone, {}, 'none', {})
call <sid>hi('typescriptImport', s:cdRed, {}, 'none', {})
call <sid>hi('typescriptVariable', s:cdRed, {}, 'none', {})
call <sid>hi('typescriptExport', s:cdRed, {}, 'none', {})
call <sid>hi('typescriptTypeReference', s:cdNone, {}, 'none', {})
call <sid>hi('typescriptCastKeyword', s:cdRed, {}, 'none', {})
call <sid>hi('typescriptCall', s:cdNone, {}, 'none', {})
call <sid>hi('typescriptPredefinedType', s:cdBlue, {}, 'none', {})
call <sid>hi('typescriptDOMDocProp', s:cdBlue, {}, 'none', {})
call <sid>hi('typescriptTypeParameter', s:cdNone, {}, 'none', {})
call <sid>hi('typescriptInterfaceTypeParameter', s:cdBlue, {}, 'none', {})
call <sid>hi('typescriptAmbientDeclaration', s:cdRed, {}, 'none', {})
call <sid>hi('typescriptModule', s:cdRed, {}, 'none', {})
call <sid>hi('typescriptFuncType', s:cdNone, {}, 'none', {})
call <sid>hi('typescriptFuncTypeArrow', s:cdBlue, {}, 'none', {})
call <sid>hi('typescriptInterfaceName', s:cdNone, {}, 'none', {})
call <sid>hi('typescriptGlobal', s:cdNone, {}, 'none', {})
call <sid>hi('typescriptDOMFormProp', s:cdBlue, {}, 'none', {})
call <sid>hi('typescriptUnion', s:cdBlue, {}, 'none', {})
call <sid>hi('typescriptBOMWindowProp', s:cdNone, {}, 'none', {})
call <sid>hi('typescriptBOMNavigatorProp', s:cdPurple, {}, 'none', {})
call <sid>hi('typescriptHeadersMethod', s:cdPurple, {}, 'none', {})
call <sid>hi('typescriptObjectLabel', s:cdBlue, {}, 'none', {})

" XML:
call <sid>hi('xmlTagName', s:cdGreen, {}, 'none', {})
call <sid>hi('xmlTag', s:cdFront, {}, 'none', {})
call <sid>hi('xmlEndTag', s:cdFront, {}, 'none', {})
call <sid>hi('xmlAttrib', s:cdPurple, {}, 'none', {})

" Ruby:
call <sid>hi('rubySymbol', s:cdFront, {}, 'none', {})
call <sid>hi('rubyConstant', s:cdOrange, {}, 'none', {})
call <sid>hi('rubyClass', s:cdRed, {}, 'none', {})
call <sid>hi('rubyDefine', s:cdRed, {}, 'none', {})

" Golang:
call <sid>hi('goFormatSpecifier', s:cdDarkBlue, {}, 'none', {})

" Python:
call <sid>hi('pythonInclude', s:cdRed, {}, 'none', {})
call <sid>hi('pythonStatement', s:cdRed, {}, 'none', {})

" TeX:
call <sid>hi('initexJobCommand', s:cdBlue, {}, 'none', {})

" SH:
call <sid>hi('shRange', s:cdFront, {}, 'none', {})
call <sid>hi('shQuote', s:cdFront, {}, 'none', {})
call <sid>hi('shDeref', s:cdFront, {}, 'none', {})
call <sid>hi('shStatement', s:cdRed, {}, 'none', {})
call <sid>hi('shOperator', s:cdFront, {}, 'none', {})
call <sid>hi('shSnglCase', s:cdFront, {}, 'none', {})
call <sid>hi('shCommandSub', s:cdFront, {}, 'none', {})
call <sid>hi('shCmdSubRegion', s:cdFront, {}, 'none', {})
call <sid>hi('kshSpecialVariables', s:cdFront, {}, 'none', {})

" SQL:
call <sid>hi('sqlKeyword', s:cdRed, {}, 'none', {})
call <sid>hi('sqlSpecial', s:cdRed, {}, 'none', {})
call <sid>hi('sqlOperator', s:cdRed, {}, 'none', {})

" GitGutter:
call <sid>hi('GitGutterAdd', s:cdGreen, s:cdBack, 'none', {})
call <sid>hi('GitGutterChange', s:cdDiffChange, s:cdBack, 'none', {})
call <sid>hi('GitGutterDelete', s:cdDiffRedFg, s:cdBack, 'none', {})

