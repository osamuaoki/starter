# 💤 LazyVim -- customized by osamu

This [osamu's starter](https://github.com/osamuaoki/starter) is a copy and fork
of the [upstream starter template](https://github.com/LazyVim/starter) for
[LazyVim](https://github.com/LazyVim/LazyVim).

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

In order to update the latest upstream main branch, add following to `.git/config` file.

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

## Features

Basic idea is to keep fancy functionalities accessible but keep them off as
started with 💤 LazyVim functionalities as much as possible.  So I can feel
like using plain `nvim` without major custom configuration changes.

I made extra features of LazyVim disabled as started as much as possible via
settings of options and global variables so they can be set as nvim starts.
These can be toggled by keymaps started with `<leader>u`.

* nonumber (Toggle with `<leader>ul`)
* norelativenumber (Toggle with `<leader>up`)
* no auto pairs (Toggle with `<leader>up`)
* no autoformat on save (`nvim-lspconfig`, Toggle with `<leader>uf`)
* no diagnostic (Toggle with `<leader>ud`)
* no completion

I added extra features:

* unicode code point HEX display (while replacing clock display and removing separator) in statusline.  E.g., `[+U20]`.
* Vim internal optional `cfilter` package for better quickfix list experiences.
* `tris203/precognition.nvim` package for better navigation.
* Cosmetic changes to ensure which-key menu for `<leader>` to be less crowded (< 10 chrs).

I added extra key bindings (`†` after corresponding explanations):

* Under `<leader>t`, several floating Terminals (Bash, Perl REPL, Python, Dash, Midnight_Commander)
* `<leader>uu` as "NOP" to prevent accidental `u` in Normal mode. (hidden for which-key)
* `<leader>uQ` to be non-quiet -- enable all fancy LazyVim behaviors
* `<leader>uq` to be quiet -- default plain nvim behaviors
* `<leader>um` to toggle completion (Global)
* `<leader>uM` to toggle completion (Buffer)
* `<leader>uP` to toggle precognition


I kept `:set ignorecase` and `:set smartcase`.

* Use regex string with mixed-cases or `\C` to make search as case sensitive one for nvim internal searches
* Use regex string with `\c` to force search as case insensitive one for nvim internal searches
* Use regex string with `(?-i)` as case sensitive one for `:gr pattern`
* Use regex string with `(?i)` as case insensitive one for `:gr pattern`

I use `git reset --mixed` to clean this checked out configuration to preserve `*.json` settings for LazyExtras.

## Reminders

### Editorconfig

Text data are modified upon save not only by LSP based **Auto Format** but also by **Editorconfig** settings.

Place practically empty `~/.editorconfig` to disable for sources without `.editorconfig`:

```
root = true
```

### Commenting block of lines

In VISUAL-LINE mode, use `gc`.  (`g`-prefix is not only for GOTO).

### Notification

I shortened notification timeout from 3 sec to 1 sec to be **quiet**.  If needed, use `<leader>snh` to see them.

## More info

Refer also to the [upstream
documentation](https://lazyvim.github.io/installation) to get started.
