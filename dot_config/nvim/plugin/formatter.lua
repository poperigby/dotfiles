-- Format on write
vim.api.nvim_exec(
    [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.py,*.pybuild,*.lua FormatWrite
augroup END
]],
    true
)

require("formatter").setup({
    filetype = {
        python = {
            function()
                return {
                    exe = "black",
                    args = { "-" },
                    stdin = true,
                }
            end,
        },
        lua = {
            function()
                return {
                    exe = "stylua",
                    args = { "--indent-type", "Spaces", "-" },
                    stdin = true,
                }
            end,
        },
    },
})