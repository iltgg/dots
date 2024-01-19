set number
set relativenumber

set listchars=tab:▹▹▸,trail:~
set invlist

filetype on
syntax on

let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"
set ttimeout
set ttimeoutlen=1
set ttyfast
