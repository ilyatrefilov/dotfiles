-- vim.g.config_colorscheme = "gruvbox-baby"
vim.g.config_colorscheme = "catppuccin-mocha"

function ColorMyPencils()
    vim.cmd("colorscheme " .. vim.g.config_colorscheme)
    local hl = function(thing, opts)
        vim.api.nvim_set_hl(0, thing, opts)
    end


    -- hl("SignColumn", {
    -- bg = "none",
    -- })
    -- --
    -- hl("ColorColumn", {
    -- ctermbg = 0,
    -- -- bg = "#29ccb1",
    -- bg = "#555555"
    -- })
    -- --
    -- hl("CursorLineNR", {
    -- bg = "None"
    -- })
    --
    -- hl("Normal", {
    -- ctermbg = 0,
    -- bg = "none"
    -- })
    -- --
    -- hl("LineNr", {
    -- fg = "#5eacd3"
    -- })
    -- --
    -- -- hl("netrwDir", {
    -- -- fg = "#5eacd3"
    -- -- })
end

ColorMyPencils()
