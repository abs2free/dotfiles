
"-------------------------------------------------------------------------------
" Vim-Go 
" :GoRun :GoBuild :GoInstall
"
" :GoDef          # goto definition of object under cursor
" Ctrl-O / Ctrl-I # hop back to your source file/return to definition
"
" :GoDoc          # opens up a side window for quick documentationn
" K               # also has the same effect
"
"
" :GoTest         # run every *_test.go file and report results
" :GoTestFunc     # or just test the function under your cursor
" :GoCoverage     # check your test coverage
" :GoAlternate	# switch bewteen your test case and implementation
"
" :GoImport       # manage and name your imports
" :GoImportAs
" :GoDrop
"
" :GoRename       # precise renaming of identifiers
"
" :GoLint         # lint your code
" :GoVer
" :GoErrCheck
"
" :GoAddTags      # manage your tags
" :GoRemoveTags
"-------------------------------------------------------------------------------
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_fmt_autosave = 1 

let g:go_addtags_transform = "camelcase"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 0
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
" Automatically get signature/type info for object under cursor
let g:go_auto_type_info = 1

" let g:go_metalinter_autosave = 1
let g:go_metalinter_command = "golangci-lint"
let g:go_metalinter_enabled = ['vet', 'revive', 'errcheck']
let g:go_metalinter_deadline = "5s"
let g:go_fmt_experimental = 1

" highlight same variable in view
let g:go_auto_sameids = 1
let g:go_list_type = "quickfix"
let g:go_test_timeout = '10s'
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

" nnoremap <leader>a :cclose<CR>
" autocmd FileType go nmap <leader>r  <Plug>(go-run)

"let g:go_debug=['lsp']

" 我自定义的
noremap <leader>gl :GoLint<CR>
noremap <leader>gf :GoFmt<CR> 
noremap <leader>gml :GoMetaLinter<CR>
