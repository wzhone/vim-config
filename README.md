# vim-config 

1. 安装vim-plug插件管理器

Linux
```

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
       
Powershell
```
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
```

2. 安装插件

Linux
```
mkdir -p ~/.config/nvim
cp init.vim ~/.config/nvim
nvim 
:PlugInstall
```

Powershell
```

```

3. 安装其他组件
```
apt install universal-ctags
```


插件将会被安装的位置： `~/.local/share/nvim/plugged/vim-config`
