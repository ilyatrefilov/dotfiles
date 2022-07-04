require'treesitter-context'.setup{
    enable = true, 
    max_lines = 0, 
    patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
        default = {
            'class',
            'function',
            'method',
            'for', 
            'while',
            'if',
            'switch',
            'case',
        },
           rust = {
               'loop_expression',
               'impl_item',
           },
    },
    exact_patterns = {
        -- Example for a specific filetype with Lua patterns
        -- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
        -- exactly match "impl_item" only)
        -- rust = true,
    },

    -- [!] The options below are exposed but shouldn't require your attention,
    --     you can safely ignore them.

    zindex = 20, -- The Z-index of the context window
}
