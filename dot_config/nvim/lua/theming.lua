vim.o.background = "dark"

require("gruvbox").setup({
    transparent_mode = true,
    italic = {
        strings = false
    },
    overrides = {
        -- Make incorrectly spelled words have a curly red underline
        SpellBad                 = { undercurl = true, sp = "#fb4934" },

        -- Use straight underlines for diagnostics
        DiagnosticUnderlineError = { underline = true, sp = "#fb4934" },
        DiagnosticUnderlineWarn  = { underline = true, sp = "#fabd2f" },
        DiagnosticUnderlineInfo  = { underline = true, sp = "#83a598" },
        DiagnosticUnderlineHint  = { underline = true, sp = "#8ec07c" },

        -- Make whitespace easier to see
        Whitespace               = { fg = "#928374" },

        -- Make float backgrounds darker (and not transparent)
        NormalFloat              = { bg = "#282828" },
    },
})

vim.cmd("colorscheme gruvbox")
