# vim-config 

1. 安装vim-plug插件管理器

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

2. 安装插件

```
mkdir -p ~/.config/nvim
cp init.vim ~/.config/nvim
nvim 
:PlugInstall
```



插件将会被安装的位置： `~/.local/share/nvim/plugged/vim-config`
