return {
  'stevearc/aerial.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('aerial').setup {
      backends = { 'lsp', 'treesitter' },
      layout = {
        min_width = 40,
      },
      show_guides = true,
      guides = {
        -- When the child item has a sibling below it
        mid_item = '├─',
        -- When the child item is the last in the list
        last_item = '└─',
        -- When there are nested child guides to the right
        nested_top = '│ ',
        -- Raw indentation
        whitespace = '  ',
      },
      filter_kind = false,
    }
  end,
  keys = {
    { '<leader>o', '<cmd>AerialToggle!<CR>', desc = 'Toggle Aerial' },
  },
}
