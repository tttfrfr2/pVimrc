cd ~/vim/src
echo 'start build vim'
sudo make distclean
./configure \
    --with-features=huge \
    --enable-gui=gtk2 \
    --enable-perlinterp=yes \
    --enable-pythoninterp=yes \
    --enable-python3interp=yes \
    --enable-rubyinterp=yes \
    --enable-luainterp=yes \
    --enable-fail-if-missing

sudo make
sudo make install
