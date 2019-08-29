" Maintainer: lbrayner (https://github.com/lbrayner)

" Based on tarPlugin.vim v29

" Original header by Charles E. Campbell
"
"" tarPlugin.vim -- a Vim plugin for browsing tarfiles
"" Original was copyright (c) 2002, Michael C. Toren <mct@toren.net>
"" Modified by Charles E. Campbell
"" Distributed under the GNU General Public License.
"
" ---------------------------------------------------------------------
"  Load Once: {{{1
if &cp || exists("g:loaded_rtarPlugin")
 finish
endif
let g:loaded_rtarPlugin = "r29"
let s:keepcpo          = &cpo
set cpo&vim

" ---------------------------------------------------------------------
"  Public Interface: {{{1
augroup tar
  au!
  au BufReadCmd   tarfile::*	call rtar#Read(expand("<amatch>"), 1)
  au FileReadCmd  tarfile::*	call rtar#Read(expand("<amatch>"), 0)
  au BufWriteCmd  tarfile::*	call rtar#Write(expand("<amatch>"))
  au FileWriteCmd tarfile::*	call rtar#Write(expand("<amatch>"))

  if has("unix")
   au BufReadCmd   tarfile::*/*	call rtar#Read(expand("<amatch>"), 1)
   au FileReadCmd  tarfile::*/*	call rtar#Read(expand("<amatch>"), 0)
   au BufWriteCmd  tarfile::*/*	call rtar#Write(expand("<amatch>"))
   au FileWriteCmd tarfile::*/*	call rtar#Write(expand("<amatch>"))
  endif

  au BufReadCmd   *.tar.gz		call rtar#Browse(expand("<amatch>"))
  au BufReadCmd   *.tar			call rtar#Browse(expand("<amatch>"))
  au BufReadCmd   *.lrp			call rtar#Browse(expand("<amatch>"))
  au BufReadCmd   *.tar.bz2		call rtar#Browse(expand("<amatch>"))
  au BufReadCmd   *.tar.Z		call rtar#Browse(expand("<amatch>"))
  au BufReadCmd   *.tgz			call rtar#Browse(expand("<amatch>"))
  au BufReadCmd   *.tbz			call rtar#Browse(expand("<amatch>"))
  au BufReadCmd   *.tar.lzma	call rtar#Browse(expand("<amatch>"))
  au BufReadCmd   *.tar.xz		call rtar#Browse(expand("<amatch>"))
  au BufReadCmd   *.txz			call rtar#Browse(expand("<amatch>"))
augroup END
com! -nargs=? -complete=file Vimuntar call rtar#Vimuntar(<q-args>)

" ---------------------------------------------------------------------
" Restoration And Modelines: {{{1
" vim:shiftwidth=2 foldmethod=marker
let &cpo= s:keepcpo
unlet s:keepcpo
