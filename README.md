# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## Osamu's customization (LazyVim v14)

Osamu's customization involves followings:

* customize statusline w/o clock display
  * unicode code point display in HEX  E.g., `[+U20]`.
  * filetype display  E.g., `[lua]`.
* Add RED Highlight to tailspace
* `jk` for `<ESC>`
* `<leader>u<tab>` to set tabstop
* `<leader>uu` for NOP to avoid accidental `u`.
* `<leader>uX` for Lazy Extras (without opening screen).
* Make fancy functionalities as opt-in with which-key supported key-bindings
  * Disable/enable minipair at start (options.lua)
  * Disable/enable completion at start and toggle via `<leader>uB`
  * Disable/enable tailspace at start and toggle via `<leader>ut`
  * Extra key binding has `†` after description
* Add precognition support (educational)

### Todo

* UI for setting timeout for notification
* Quiet opening screen

<!--

Dropped for simplicity
* `<leader>uM` to toggle List Mode
* `<leader>uo` to set spelloptions ("",camel,noplainbuffer)
* `<leader>uS` to set signcolumn
* `<leader>uz` to set foldcolumn


TODO
* Set notification timeout with `<leader>uN`. (Currently, it starts with 5000ms)
* Erase notification also with `<esc>` so long timeout is OK.
* Cool "fade_in_slide_out"

-->

## Install and update

I use this configuration by:

* cloning this to `~/.config/nvim_osamu/` and
* setting alias of `vi` as `alias vi='NVIM_APPNAME=nvim_osamu /usr/bin/nvim'`.

```console
 $ git clone -b osamu-wip git@github.com:osamuaoki/starter.git ~/.config/nvim_osamu
```

This configuration can be used by `nvim` and `vi` command by adding following lines to `~/.bashrc`:

```console
export NVIM_APPNAME=nvim_osamu
alias vi='NVIM_APPNAME=nvim_osamu /usr/bin/nvim'
```

This `osamu-wip` branch is the branch which contains my latest forked content and
is meant to be a backup of my workstation.

Latest LazyVim added many `<leader>u` key-bindings.  So this is update of
configuration described in my previous outdated memos:

* [Re-learning Vim (7): LazyVim customization](https://osamuaoki.github.io/en/2023/03/05/vim-learn-7/#lazyvim-customization)
* [Re-learning Vim (10): which-key v3 updates](https://osamuaoki.github.io/en/2024/06/08/vim-learn-10/#which-key-v3-updates)

This is only meant to be my backup configuration. I will mercilessly apply
rebase to the latest upstream main branch and force push this branch. (My old
settings may be found in other branches.)

In order to track the latest upstream main branch, add following to `.git/config` file.

```ini
[remote "upstream"]
  url = https://github.com/LazyVim/starter
  pushurl = DISABLED_FOR_PUSH
  fetch = +refs/heads/*:refs/remotes/upstream/*
```

Then, I will mercilessly rebase "osamu-wip" branch with:

```console
 $ git remote update
 $ git rebase -i upstream/main
 ...
 $ git push -f
```

<!--
I now commit `lazyvim.json` to this repo.  This records LazyExtras selected packages.  (It seems `lazy-lock.json` is not as critical.)
-->

## NOTE: Search tricks

I kept `:set ignorecase` and `:set smartcase`.

* Use regex string with mixed-cases or `\C` to make search as case sensitive one for nvim internal searches
* Use regex string with `\c` to force search as case insensitive one for nvim internal searches
* Use regex string with `(?-i)` as case sensitive one for `:gr pattern` (backend: `rg`)
* Use regex string with `(?i)` as case insensitive one for `:gr pattern` (backend: `rg`)

## NOTE: Quickfix

Items in Quickfix List can be managed via Telescope with the following keymap:

* `<Tab>`: Mark item
* `<S-Tab>`: Un-mark item
* `<C-q>`: Send all items **not marked** to quickfixlist (qflist) (C=Select mark-**C**leared)
* `<M-q>`: Send all items **marked** to quickfixlist (qflist) (M=**M**arked)

Quickfix list history can be managed via Telescope with the following keymap:

* `<leader>xf`: Quickfix list (FzfLua)
* `<leader>xF`: Location list (FzfLua)
* `<leader>xh`: Quickfix stack (FzfLua)


## NOTE: Editorconfig

Text data are modified upon save not only by LSP based **Auto Format** but also by **Editorconfig** settings.

Place practically empty `~/.editorconfig` to disable Editorconfig for sources without `.editorconfig`:

```dot
root = true
```

## NOTE: Commenting block of lines

In VISUAL-LINE mode, use `gc`.  (`g`-prefix is not only for GOTO.).

## NOTE: Terminal

Running `mc` in terminal window is problematic even with `--colors=...` ... so I gave up.

## More info

Refer also to the [upstream
documentation](https://lazyvim.github.io/installation) to get started.
