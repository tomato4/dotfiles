if !exists('g:loaded_nvim_treesitter')
  echom "Not loaded Treesitter"
  finish
endif

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "fish",
    "bash",
    "vim",
    "php",
    "json",
    "yaml",
    "scss",
    "css",
    "dockerfile",
    "latex",
    "regex",
    "c",
    "cpp",
    "c_sharp",
    "java",
    "javascript",
    "python",
    "scala",
    "lua",
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
EOF
