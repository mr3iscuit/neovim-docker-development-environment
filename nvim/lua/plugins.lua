local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

local lazy = require "lazy"

local plugins = {
    -- jdtls
    -- {
    --     "mfussenegger/nvim-jdtls",
    --     version = "*",
    --     config = function ()
    --         require("plugins/java.lua")
    --     end,
    --     ft = { "java" },
    -- },
    -- {
    --     "rust-lang/rust.vim",
    --     config = function ()
    --
    --     end,
    -- },
    -- stdlib
    { "nvim-lua/plenary.nvim",      version = "*", },

    -- fzf
    { "junegunn/fzf",               version = "*", },

    -- formatter
    { 'mhartington/formatter.nvim', version = "*", config = function() require "plugins/format-nvim" end },

    -- theming
    { 'projekt0n/github-nvim-theme' }, { "catppuccin/nvim", as = "catppuccin" },

    -- essentials
    {
        "echasnovski/mini.trailspace",
        version = "*",
        event = "BufEnter",
        config = function() require("mini.trailspace").setup {} end,
    },
    { "windwp/nvim-autopairs",               version = "*", config = function() require("nvim-autopairs").setup {} end },
    { "kyazdani42/nvim-web-devicons",        version = "*", },
    { "folke/zen-mode.nvim",                 version = "*", },
    { "lukas-reineke/indent-blankline.nvim", version = "*", config = function() require "plugins/indent-blankline" end, },

    -- treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        version = "*",
        dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects', },
        event = "BufEnter",
        config = function() require "plugins/treesitter" end,
        build = ":TSUpdate",
    },
    { "nvim-treesitter/nvim-treesitter-textobjects", version = "*", event = "BufEnter", },
    { "nkrkv/nvim-treesitter-rescript",              version = "*", },
    -- treesitter\

    -- Align
    { 'Vonr/align.nvim',                             version = "*", },

    -- lsp
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            { 'j-hui/fidget.nvim', opts = {} },
        },
        config = function() require "plugins/lsp" end,
    },
    {
        "glepnir/lspsaga.nvim",
        event = "BufEnter",
        config = function() require "plugins/lspsaga" end,
    },
    -- lsp\

    -- autocompletions
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets'
        },
        config = function() require "plugins/cmp" end,
    },

    {
        'mfussenegger/nvim-dap',
        dependencies = {
            'jay-babu/mason-nvim-dap.nvim',
            'rcarriga/nvim-dap-ui',
            'williamboman/mason.nvim',
            'leoluz/nvim-dap-go',
        },
        config = function() require "plugins/dap" end,
    },
    --outocompletions\

    -- flutter
    {
        "akinsho/flutter-tools.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    -- flutter\

    -- file tree
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        dependencies = { "kyazdani42/nvim-web-devicons" },
        config = function()
            require("plugins/tree")
            require('nvim-tree').setup()
        end,
    },
    -- file tree\

    -- fuzzy finders
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            "telescope-fzf-native.nvim",
        },
        config = function() require "plugins/telescope" end,
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
            return vim.fn.executable 'make' == 1
        end,
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
    },
    {
        "ThePrimeagen/harpoon",
    },
    -- fuzzy finders\

    -- bars
    {
        "nvim-lualine/lualine.nvim",
        version = "*",
        event = "VimEnter",
        dependencies = { "kyazdani42/nvim-web-devicons" },
        config = function() require "plugins/lualine" end,
    },

    -- terminal
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function() require "plugins/toggleterm" end,
    },

    -- git
    {
        "lewis6991/gitsigns.nvim",
        version = "*",
        event = "BufEnter",
        config = function() require "plugins/gitsigns" end,
    },

    -- comments
    {
        "numToStr/Comment.nvim",
        version = "*",
        event = "BufEnter",
        config = function() require "plugins/comment" end,
    },

    -- markdown
    {
        "mzlogin/vim-markdown-toc",
        version = "*",
    },

    -- misc
    {
        "folke/which-key.nvim",
        version = "*",
        config = function() require "plugins/which-key" end,
    },
    {
        "jiaoshijie/undotree",
        config = function() require "plugins/undotree" end,
    }
}

local options = {
    defaults = {
        lazy = false,
        version = "*",
    },
    lockfile = "~/.config/nvim/lazy-lock.json", -- FIXME: It would be great to have it under nix
}

lazy.setup(plugins, options)
