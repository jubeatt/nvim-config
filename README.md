# Neovim Configuration

## 這是什麼？

這是我的 Neovim 配置，內容主要是參考 [Neovim from scratch](https://github.com/LunarVim/Neovim-from-scratch) 這個 Repo 跟他的 [youtube 教學](https://www.youtube.com/watch?v=ctH-a-1eUME&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ) 來撰寫的。

個人覺得這是很好的參考資源，有空的話很建議參考一下上面貼的連結。

## 使用方式

Make sure to remove or move your current `nvim` directory

```
git clone git@github.com:jubeatt/nvim-config.git ~/.config/nvim
```

Run `nvim` and wait for the plugins to be installed

**NOTE** (You will notice treesitter pulling in a bunch of parsers the next time you open Neovim)

each video will be associated with a branch so checkout the one you are interested in

## 檢查健康度

Open `nvim` and enter the following:

```
:checkhealth
```

You'll probably notice you don't have support for copy/paste also that python and node haven't been setup

So let's fix that

First we'll fix copy/paste

- On mac `pbcopy` should be builtin

- On Ubuntu

  ```
  sudo apt install xsel
  ```

- On Arch Linux

  ```
  sudo pacman -S xsel
  ```

Next we need to install python support (node is optional)

- Neovim python support

  ```
  pip install pynvim
  ```

- Neovim node support

  ```
  npm i -g neovim
  ```
