local cmp = require("cmp")
local source_mapping = {
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[Lua]",
        cmp_tabnine = "[TN]",
        path = "[Path]",
}
local lspkind = require("lspkind")

cmp.setup({
        snippet = {
                expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                end,
        },
        mapping = cmp.mapping.preset.insert({
                ["<Tab>"] = cmp.mapping.confirm({ select = true }),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
        }),
        sources = {
                { name = "cmp_tabnine" },
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" },
        },
})

local tabnine = require("cmp_tabnine.config")
tabnine:setup({
        max_lines = 1000,
        max_num_results = 10,
        sort = true,
        run_on_every_keystroke = true,
        snippet_placeholder = "..",
        show_prediction_strength = true,
})

local on_attach = function(client, bufnr)
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format { async = true } end, bufopts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end)
  require("lsp_signature").on_attach({
      doc_lines = 0,
      handler_opts = {
          border = "none",
      },
  }, bufnr)
end

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

require("lspconfig").tsserver.setup({
        on_attach = on_attach,
        capabilities = capabilities,
})

require("lspconfig").jedi_language_server.setup({
        on_attach = on_attach,
        capabilities = capabilities,
})

require("lspconfig").gopls.setup({
        on_attach = on_attach,
        cmd = { "gopls", "serve" },
        settings = {
                gopls = {
                        analyses = {
                                unusedparams = true,
                        },
                        staticcheck = true,
                },
        },
        capabilities = capabilities,
})

require("lspconfig").rust_analyzer.setup({
        on_attach = on_attach,
        cmd = { "rustup", "run", "stable", "rust-analyzer"},
        capabilities = capabilities, 
})

require("fidget").setup()

require("luasnip.loaders.from_vscode").lazy_load({
        include = nil, -- Load all languages
        exclude = {},
})


