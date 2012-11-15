" Shortcut for ESCAPE "
inoremap jj <Esc>

" Disable arrow keys "
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" Contextual selection "
map <C-k> ?{

" Running tests from the editor "
map <f2> :!phpunit <cr>
map <f3> :!phpunit % <cr>

" Getting superuser "
command W w !sudo tee % > /dev/null

" My folding configuration "
set foldmethod=manual
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

" Code generation "
map <C-F> o	public function getpb3l~A(