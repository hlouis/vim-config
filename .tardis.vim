let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Develop/tardis/server/lib_serverapp/sdk
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 ~/Develop/tardis/bin/script/dms/system.lua
badd +368 ~/Develop/tardis/server/server_dm/src/dm_lua_mysql.cpp
badd +1 sa_dms_agent.h
badd +81 sa_gate_agent.h
badd +114 ~/Develop/tardis/server/lib_serverapp/src/sa_gate_agent.cpp
badd +398 ~/Develop/tardis/server/server_gate/head/gate_server.h
badd +96 sa_event_dispatcher.h
badd +164 ~/Develop/tardis/server/lib_net/sdk/yq_net.h
badd +1 ~/Develop/tardis/bin/script/^M^W^W
badd +7 ~/Develop/tardis/server/lib_serverapp/premake4.lua
badd +1 ~/Develop/tardis/server/premake4.lua
badd +384 ~/Develop/tardis/server/server_gate/src/gate_server.cpp
badd +4 ~/Develop/tardis/server/server_gate/premake4.lua
badd +18 ~/Develop/tardis/server/shared/head/cmd_protocol.h
badd +29 ~/Develop/tardis/server/premake/helper.lua
badd +1 ~/Develop/tardis/server/lib_net/sdk/yq_net.c
badd +5 ~/Develop/tardis/server/lib_net/src/yqn_net_imp.cpp
badd +1 ~/Develop/tardis/server/server_gate/^M^W^W
badd +122 ~/.vim/.vimrc
badd +12 ~/.vim/plugin/surround.vim
badd +17 ~/.vim/colors/desertEx.vim
badd +80 ~/.vim/colors/ir_black.vim
badd +8 ~/Develop/tardis/server/lib_dm/premake4.lua
badd +2072 ~/Develop/tardis/server/lib_dm/src/dm_object.cpp
badd +1 ~/Develop/tardis/server/lib_dm/src/dm_object.h
badd +1 ~/Develop/tardis/server/lib_dm/sdk/dm_object.h
badd +1 ~/Develop/tardis/server/server_dummy/premake4.lua
badd +74 ~/Develop/tardis/server/server_dummy/src/main.cpp
badd +11 ~/Develop/tardis/server/server_kernel/premake4.lua
badd +673 ~/Develop/tardis/server/server_kernel/src/kernel_server.cpp
badd +96 ~/Develop/tardis/server/lib_dm/sdk/data_matrix.h
badd +1 ~/Develop/tardis/server/server_kernel/src/kernel_server.h
badd +156 ~/Develop/tardis/server/server_kernel/head/kernel_server.h
badd +42 ~/Develop/tardis/server/lib_dm/src/data_matrix.cpp
badd +92 ~/.vim/doc/surround.txt
badd +1 ~/Develop/tardis/server/lib_net/^M^W^W
badd +123 ~/.vim/colors/inkpot.vim
badd +1 ~/Develop/tardis/bin/script/dms/^M^W^W
badd +0 ~/Develop/tardis/bin/script/player.lua
badd +390 ~/Develop/tardis/server/lib_serverapp/src/sa_lua_dm.cpp
badd +1 ~/Develop/tardis/server/client_sample/premake4.lua
badd +52 ~/Develop/tardis/server/client_sample/src/client_sample.cpp
badd +1 ~/Develop/tardis/server/client_sample/src/client_sample.h
badd +49 ~/Develop/tardis/server/client_sample/head/client_sample.h
badd +12 ~/Develop/tardis/server/server_dm/premake4.lua
badd +1 ~/Develop/tardis/server/server_dm/src/dm_server.cpp
badd +138 ~/Develop/tardis/server/server_dm/head/dm_server.h
badd +0 ~/.vim/plugin/a.vim
silent! argdel *
set lines=91 columns=144
edit ~/Develop/tardis/bin/script/dms/system.lua
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd t
set winheight=1 winwidth=1
exe '1resize ' . ((&lines * 44 + 45) / 91)
exe '2resize ' . ((&lines * 44 + 45) / 91)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 18 - ((8 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
18
normal! 02l
lcd ~/Develop/tardis/bin/script/dms
wincmd w
argglobal
edit ~/Develop/tardis/bin/script/player.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 226 - ((8 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
226
normal! 0
lcd ~/Develop/tardis/bin/script/dms
wincmd w
exe '1resize ' . ((&lines * 44 + 45) / 91)
exe '2resize ' . ((&lines * 44 + 45) / 91)
tabedit ~/Develop/tardis/server/server_dm/head/dm_server.h
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd t
set winheight=1 winwidth=1
exe '1resize ' . ((&lines * 44 + 45) / 91)
exe '2resize ' . ((&lines * 44 + 45) / 91)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 69 - ((38 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
69
normal! 01l
wincmd w
argglobal
edit ~/Develop/tardis/server/server_dm/src/dm_server.cpp
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 90 - ((5 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
90
normal! 056l
lcd ~/Develop/tardis/server/server_dm
wincmd w
exe '1resize ' . ((&lines * 44 + 45) / 91)
exe '2resize ' . ((&lines * 44 + 45) / 91)
tabedit ~/Develop/tardis/server/lib_serverapp/sdk/sa_gate_agent.h
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd t
set winheight=1 winwidth=1
exe '1resize ' . ((&lines * 44 + 45) / 91)
exe '2resize ' . ((&lines * 44 + 45) / 91)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 74 - ((13 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
74
normal! 07l
lcd ~/Develop/tardis/server/lib_serverapp
wincmd w
argglobal
edit ~/Develop/tardis/server/lib_serverapp/src/sa_gate_agent.cpp
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 110 - ((38 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
110
normal! 02l
lcd ~/Develop/tardis/server/lib_dm
wincmd w
exe '1resize ' . ((&lines * 44 + 45) / 91)
exe '2resize ' . ((&lines * 44 + 45) / 91)
tabedit ~/.vim/plugin/a.vim
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd t
set winheight=1 winwidth=1
exe '1resize ' . ((&lines * 44 + 45) / 91)
exe '2resize ' . ((&lines * 44 + 45) / 91)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 118 - ((30 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
118
normal! 0
lcd ~/Develop/tardis/server/lib_net
wincmd w
argglobal
edit ~/.vim/doc/alternate.txt
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 48 - ((5 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
48
normal! 0
lcd ~/Develop/tardis/server/lib_net
wincmd w
exe '1resize ' . ((&lines * 44 + 45) / 91)
exe '2resize ' . ((&lines * 44 + 45) / 91)
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
