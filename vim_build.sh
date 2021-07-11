sudo apt build-dep vim
sudo apt install -y git gettext libtinfo-dev  libacl1-dev libgpm-dev build-essential libxmu-dev libgtk2.0-dev libxpm-dev libperl-dev python-dev python3-dev ruby-dev lua5.2 liblua5.2-dev luajit libluajit-5.1-dev autoconf automake cproto 
git clone https://github.com/vim/vim.git
cd vim/src
git pull
./configure --with-features=huge --enable-gui=gtk2 --enable-fail-if-missing --enable-perlinterp --enable-pythoninterp --enable-python3interp --enable-rubyinterp --enable-luainterp --with-luajit
make

sudo make install
