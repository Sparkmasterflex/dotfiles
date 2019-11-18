" This option stops vim from behaving in a strongly vi -compatible way
set nocompatible

set nu " Line numbers
set ruler " Show cursor position 

" Set syntax highlighting options.
" set t_Co=256
" set background=dark
syntax on
" colorschemes: 
" colorscheme badwolf

" Get our tabs in-line with other envs
set shiftwidth=2 softtabstop=2 expandtab

set hlsearch " Highlight searches
set ignorecase " Ignore case of searches.
set incsearch " Highlight dynamically as pattern is typed.

set title " Show the filename in the window titlebar.
set visualbell " Use visual bell instead of audible bell

" Speed up viewport scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Hard to type things
imap >> →
imap << ←
imap ^^ ↑
imap VV ↓
imap aa λ

" Fix page up and down
map <PageUp> <C-U>
map <PageDown> <C-D>
imap <PageUp> <C-O><C-U>
imap <PageDown> <C-O><C-D>

" Tabularize
nmap <Leader>a# :Tabularize/#<CR>
vmap <Leader>a# :Tabularize/#<CR>
nmap <Leader>ah :Tabularize/=><CR>
vmap <Leader>ah :Tabularize/=><CR>
" lolvim: the sequence \"\@!" apparently means \"zero of the thing I just said\"
nmap <Leader>a= :Tabularize/=>\@!<CR>
vmap <Leader>a= :Tabularize/=>\@!<CR>
vmap <Leader>a; :Tabularize/;<CR>

" NOTES:
" * \zs is basically a zero-width lookbehind assertion;
"   it eats spaces before the comma/colon/whatever.
"   See: http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
" * l0c1 is a format specifier that says
"   left, then zero spaces, then [delimiter], then 1 space
"   See: https://raw.github.com/godlygeek/tabular/master/doc/Tabular.txt
nmap <Leader>a: :Tabularize/:\zs/l0c1<CR>
vmap <Leader>a: :Tabularize/:\zs/l0c1<CR>
nmap <Leader>a, :Tabularize/,\zs/l0c1<CR>
vmap <Leader>a, :Tabularize/,\zs/l0c1<CR>

" Restore cursor position
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" JSON
au BufRead,BufNewFile *.json set ft=json syntax=javascript

" Common Ruby files
au BufRead,BufNewFile Rakefile,Capfile,Gemfile,.autotest,.irbrc,*.treetop,*.tt set ft=ruby syntax=ruby

" Coffee Folding
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable

" Rainbow Parenthesis
nnoremap <leader>rp :RainbowParenthesesToggle<CR>
