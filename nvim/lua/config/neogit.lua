local neogit = require("neogit")
local nnoremap = require("config.keymap").nnoremap

neogit.setup {}

nnoremap("<leader>gs", function()
        neogit.open({ })
end);
