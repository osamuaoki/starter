# 💤 LazyVim -- customized by osamu

This [osamu's starter](https://github.com/osamuaoki/starter) is a copy and fork
of the [upstream starter template](https://github.com/LazyVim/starter) for
[LazyVim](https://github.com/LazyVim/LazyVim).

## Basic features

Basic idea of this customization is to keep fancy functionalities as opt-in.

I made extra features of 💤 LazyVim disabled when started as much as possible.

* Initial features are controlled in `lua/config/options.lua`.
* Features can be modified via keymaps starting with `<leader>u`.

Optional features include.

* autocompletion
* with or without dashboard
* customize statusline w/o clock display
  * unicode code point display in HEX  E.g., `[+U20]`.
  * filetype display  E.g., `[lua]`.

## Install and update

This configuration can be installed for `NVIM_APPNAME=nvim1` as:

```console
 $ git clone -b osamu git@github.com:osamuaoki/starter.git ~/.config/nvim1
```

This configuration can be used by `nvim` command as:

```console
 $ export NVIM_APPNAME=nvim1
 $ nvim
```

This `osamu` branch is the branch which contains my latest forked content and
used on my workstation. The configuration has been updated since then. This is
mentioned in my previous memos:

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

Then, I will mercilessly rebase "osamu" branch with:

```console
 $ git remote update
 $ git rebase -i upstream/main
 ...
 $ git push -f
```

## UI controls

I added extra key bindings (`†` after corresponding explanations):

* `<leader>ua` to toggle auto/manual pop-up for autocompletion
* `<leader>uM` to toggle List Mode
* `<leader>uN` to set notification timeout
* `<leader>uo` to set spelloptions ("",camel,noplainbuffer)
* `<leader>uS` to set signcolumn
* `<leader>ut` to set tabstop
* `<leader>uu` as "NOP" to prevent accidental `u` in Normal mode. (hidden for `which-key)
* `<leader>uW` to toggle check tailspace
* `<leader>uz` to set foldcolumn

<!--
* `<leader>uP` to toggle precognition
// Under `<leader>t`, several floating Terminals (Bash, Perl REPL, Python, Dash)
-->

## Search tricks

I kept `:set ignorecase` and `:set smartcase`.

* Use regex string with mixed-cases or `\C` to make search as case sensitive one for nvim internal searches
* Use regex string with `\c` to force search as case insensitive one for nvim internal searches
* Use regex string with `(?-i)` as case sensitive one for `:gr pattern` (backend: `rg`)
* Use regex string with `(?i)` as case insensitive one for `:gr pattern` (backend: `rg`)

I now commit `lazyvim.json` to this repo.  This records LazyExtras selected packages.  (It seems `lazy-lock.json` is not as critical.)

## Quickfix

I now use `editor.fzf` extension.

Items in Quickfix List can be managed via Telescope with the following keymap:

* `<Tab>`: Mark item
* `<S-Tab>`: Un-mark item
* `<C-q>`: Send all items **not marked** to quickfixlist (qflist) (C=Select mark-**C**leared)
* `<M-q>`: Send all items **marked** to quickfixlist (qflist) (M=**M**arked)

Quickfix list history can be managed via Telescope with the following keymap:

* `<leader>xf`: Quickfix list (FzfLua)
* `<leader>xF`: Location list (FzfLua)
* `<leader>xh`: Quickfix stack (FzfLua)

## Notification

* Set notification timeout with `<leader>uN`. (Currently, it starts with 5000ms)
* Erase notification also with `<esc>` so long timeout is OK.
* Cool "fade_in_slide_out"

## Editorconfig

Text data are modified upon save not only by LSP based **Auto Format** but also by **Editorconfig** settings.

Place practically empty `~/.editorconfig` to disable for sources without `.editorconfig`:

```dot
root = true
```

## Spellcheck

* `<leader>us`: spelling (enable/disable)
* `<leader>uo`: spellingoptions (`''`,`camel`,`noplainbuffer`)

## Commenting block of lines

In VISUAL-LINE mode, use `gc`.  (`g`-prefix is not only for GOTO.).

## Terminal

Running `mc` in terminal window is problematic even with `--colors=...` ... so I gave up.

## More info

Refer also to the [upstream
documentation](https://lazyvim.github.io/installation) to get started.
