require("treesitter-context").setup({
        enable = true, 
        throttle = true,
        max_lines = 2,
        show_all_context = show_all_context,
        patterns = { 
            default = {
                "function",
                "method",
                "for",
                "while",
                "if",
                "switch",
                "case",
            },

            rust = {
                "loop_expression",
                "impl_item",
                "block",
            },

            typescript = {
                "class_declaration",
                "abstract_class_declaration",
                "else_clause",
            },
        },
    })
