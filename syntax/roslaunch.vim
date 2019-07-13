" Vim syntax file
" Language:     roslaunch
" Maintainer:   Sergey Alexandrov <alexandrov88@gmail.com>
" Filenames:    *.launch

" Read YAML syntax rules that will be used to highlight code inside <rosparam>
" tags. Note that we do this before reading XML rules to make sure that YAML
" rules have lower priority (important for the definition of rosparamTag region)

if exists("b:current_syntax")
  finish
endif

let g:xml_syntax_folding=1

syn match roslaunchTag "<[^>]\+>"

syn keyword roslaunchTagName  launch containedin=roslaunchTag
syn keyword roslaunchTagName  node containedin=roslaunchTag
syn keyword roslaunchTagName  machine containedin=roslaunchTag
syn keyword roslaunchTagName  include containedin=roslaunchTag
syn keyword roslaunchTagName  remap containedin=roslaunchTag
syn keyword roslaunchTagName  env containedin=roslaunchTag
syn keyword roslaunchTagName  param containedin=roslaunchTag
syn keyword roslaunchTagName  rosparam containedin=roslaunchTag
syn keyword roslaunchTagName  group containedin=roslaunchTag
syn keyword roslaunchTagName  test containedin=roslaunchTag
syn keyword roslaunchTagName  arg containedin=roslaunchTag

" Substitution args
syn match rosSubArg "\$(arg .\{-})" containedin=roslaunchTag
syn match rosSubFind "\$(find .\{-})" containedin=roslaunchTag
syn match rosSubAnon "\$(anon .\{-})" containedin=roslaunchTag

hi link roslaunchTag Identifier
hi link roslaunchTagName Keyword
hi link rosSubArg Macro
hi link rosSubFind Macro
hi link rosSubAnon Macro

let b:current_syntax = "roslaunch"
