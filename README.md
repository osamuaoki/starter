# 💤 LazyVim -- customized by osamu

This [osamu's starter](https://github.com/osamuaoki/starter) is a copy and fork
of the [upstream starter template](https://github.com/LazyVim/starter) for
[LazyVim](https://github.com/LazyVim/LazyVim).

## Basic features

Basic idea of this customization is to keep fancy functionalities accessible
but keep them off as started with 💤 LazyVim functionalities as much as
possible.  So I can feel like using plain `nvim` without major custom
configuration changes.

I made extra features of LazyVim disabled when started as much as possible via
settings of options and global variables so they can be set as nvim starts.
These can be toggled by keymaps started with `<leader>u`.

* nonumber
* norelativenumber
* no auto pairs
* no autocompletion
* no autoformat on save
* no diagnostic
* no dashboard or with it (?)

The actual initial settings can be controlled by editing `lua/config/options.lua`.
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
used on my workstation. This is mentioned in my memo: [LazyVim
customization](https://osamuaoki.github.io/en/2023/03/05/vim-learn-7/#lazyvim-customization).
Since this is meant to be my backup configuration, I will mercilessly apply
rebase to the latest upstream main branch and force push this branch.

(My old settings may be found in other branches.)

In order to utrack the latest upstream main branch, add following to `.git/config` file.

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

I added extra features:

* unicode code point HEX display (while replacing clock display and removing separator) in statusline.  E.g., `[+U20]`.
* Vim internal optional `cfilter` package for better quickfix list experiences.
* `tris203/precognition.nvim` package for better navigation.
* Cosmetic changes to ensure which-key menu for `<leader>` to be less crowded (< 10 chrs).
* Several more Vim option settings added.

I added extra key bindings (`†` after corresponding explanations):

* `<leader>n` assigned for dismiss notification too for easy access.
* `<leader>ul` to change Line Numbers  (Old `<leader>uL` included)
* `<leader>uL` to change List Mode  (New functionality)
* `<leader>um` to toggle autocompletion
* `<leader>uo` to set the timeout for notification.
* `<leader>uP` to toggle precognition
* `<leader>uQ` to be non-quiet -- enable all fancy LazyVim behaviors
* `<leader>uq` to be quiet -- default plain nvim behaviors
* `<leader>uS` to change signcolumn
* `<leader>uu` as "NOP" to prevent accidental `u` in Normal mode. (hidden for `which-key)
* `<leader>uz` to change foldcolumn
* Under `<leader>t`, several floating Terminals (Bash, Perl REPL, Python, Dash)
* ...

## Search tricks

I kept `:set ignorecase` and `:set smartcase`.

* Use regex string with mixed-cases or `\C` to make search as case sensitive one for nvim internal searches
* Use regex string with `\c` to force search as case insensitive one for nvim internal searches
* Use regex string with `(?-i)` as case sensitive one for `:gr pattern`
* Use regex string with `(?i)` as case insensitive one for `:gr pattern`

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

* Set notification timeout with `<leader>uN`. (Currently, it starts with 200ms)
* Erase notification with `<leader>un` or its shorthand `<leader>n`.
* See older notification with `<leader>snh` or its shorthand `<leader>m`.

## Editorconfig

Text data are modified upon save not only by LSP based **Auto Format** but also by **Editorconfig** settings.

Place practically empty `~/.editorconfig` to disable for sources without `.editorconfig`:

```dot
root = true
```

## Commenting block of lines

In VISUAL-LINE mode, use `gc`.  (`g`-prefix is not only for GOTO.  Now `+goto/mod` in which-key menu).

## Terminal

Running `mc` in terminal window is problematic even with `--colors=...` ... so I gave up.

## More info

Refer also to the [upstream
documentation](https://lazyvim.github.io/installation) to get started.
