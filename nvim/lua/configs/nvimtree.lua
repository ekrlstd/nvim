local options = {
  on_attach = function(bufnr)
    local api = require('nvim-tree.api')

    local function opts(desc)
      return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- Default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- Remove the default <CR> mapping
    vim.keymap.del('n', '<CR>', { buffer = bufnr })

    -- Add 'l' to open file/folder
    vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
  end,
}

return options
