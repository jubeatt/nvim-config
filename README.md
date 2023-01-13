# Neovim Configuration

## 這是什麼？

這是我的 Neovim 配置，內容主要是參考 [Neovim from scratch](https://github.com/LunarVim/Neovim-from-scratch) 這個 Repo 跟他的 [youtube 教學](https://www.youtube.com/watch?v=ctH-a-1eUME&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ) 來撰寫的。

個人覺得這是很好的參考資源，有空的話很建議參考一下上面貼的連結。


## Requirement

- [ripgrep](https://formulae.brew.sh/formula/ripgrep) Telescope 搜尋功能的依賴項目
- [prettier](https://www.npmjs.com/package/prettier) Null-ls 執行格式化的依賴項目

## 使用方式

先安裝好 [neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)，接著確定兩件事：

1. 沒有現有的 `~/.config/nvim`資料夾，有的話請刪除
2. 沒有現有的 `.local/share/nvim/site` 資料夾，有的話請刪除

確定好以後，clone 這份設定檔到 `~/.config/nvim`（底下指令已經寫好指定路徑，直接複製貼上就好）：

```
git clone git@github.com:jubeatt/nvim-config.git ~/.config/nvim
```

Run `nvim` and wait for the plugins to be installed

**NOTE** (You will notice treesitter pulling in a bunch of parsers the next time you open Neovim)

each video will be associated with a branch so checkout the one you are interested in

## LSP 服務

這份設定檔使用的 LSP Manager 是 [mason](https://github.com/williamboman/mason.nvim)，所以要先去安裝對應的 LSP 才能開啟服務。

舉例來說，如果我想要安裝 typescript 的 LSP，就要在 neovim 下這段指令：

```bash
:Mason
```

接著就會彈出可安裝的 LSP 列表，找到 `typescript-language-server` 案 i 就可以安裝了。

我目前有裝的是這些：

- lua-language-server
- css-lsp
- vue-language-server
- tailwindcss-language-server
- emmet-ls
- typescript-language-server
- eslint-lsp


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
