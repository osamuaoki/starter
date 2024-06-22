return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        markdownlint = {
          -- disable linelength check and `$` in console example check
          --  * https://www.reddit.com/r/neovim/comments/1axhvh0/how_do_i_disable_markdownlint_in_lazyvim/
          --  * https://stackoverflow.com/questions/74319856/how-to-handle-wide-markdown-tables-and-line-length-checks-in-pre-commit
          args = { "--disable", "MD013", "--disable", "MD014", "--" },
        },
        selene = {
          -- `condition` is another LazyVim extension that allows you to
          -- dynamically enable/disable linters based on the context.
          condition = function(ctx)
            return vim.fs.find({ "selene.toml" }, { path = ctx.filename, upward = true })[1]
          end,
        },
      },
    },
  },
}
