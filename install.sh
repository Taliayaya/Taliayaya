# This is a script that install my plugins on Vim,
# By Ilan (https://github.com/Taliayaya/)


install () {
	mkdir -p ~/.vim/pack/$1/start/;
	cd ~/.vim/pack/$1/start/;
	git submodule add https://$2;
	echo "$1: Installation Complete";
}
# Init repo

cd ~/.vim/
git init
git submodule init

# Install zig.vim

install zig.vim github.com/ziglang/zig.vim

# Install fugitive

install fugitive tpope.io/vim/fugitive.git
vim -u NONE -c "helptags fugitive/doc" -c q

# Install syntastic

install syntastic github.com/scrooloose/syntastic.git
vim -U NONE -c "helptags syntastic" -c q

# Not much plugins for now but it'll slowly upgrade~~
