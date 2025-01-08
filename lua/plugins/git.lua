return {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local signs = require('gitsigns')
      signs.setup {
        signs                        = {
          add          = { text = '▎' },
          change       = { text = '▎' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~' },
          untracked    = { text = '┆' },
        },
        signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
        numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir                 = {
          interval = 700,
          follow_files = true
        },
        attach_to_untracked          = true,
        current_line_blame           = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts      = {
          virt_text = true,
          virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
          delay = 700,
          ignore_whitespace = false,
        },
        current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
        sign_priority                = 6,
        update_debounce              = 100,
        status_formatter             = nil, -- Use default
        max_file_length              = 40000,
        preview_config               = {
          -- Options passed to nvim_open_win
          border = EcoVim.ui.float.border,
          style = 'minimal',
          relative = 'cursor',
          row = 0,
          col = 1
        },
        on_attach                    = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- ╭──────────────────────────────────────────────────────────╮
          -- │ Keymappings                                              │
          -- ╰──────────────────────────────────────────────────────────╯

          -- Navigation
          map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
          end, { expr = true })

          map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
          end, { expr = true })

          -- Actions
          map({ 'n', 'v' }, '<leader>ghs', gs.stage_hunk, { desc = "stage hunk" })
          map({ 'n', 'v' }, '<leader>ghr', gs.reset_hunk, { desc = "reset hunk" })
          map('n', '<leader>ghS', gs.stage_buffer, { desc = "stage buffer" })
          map('n', '<leader>ghu', gs.undo_stage_hunk, { desc = "undo stage" })
          map('n', '<leader>ghR', gs.reset_buffer, { desc = "reset buffer" })
          map('n', '<leader>ghp', gs.preview_hunk, { desc = "preview hunk" })
          map('n', '<leader>gm', function() gs.blame_line { full = true } end, { desc = "blame line" })
          map('n', '<leader>ghd', gs.diffthis, { desc = "diff hunk" })
          map('n', '<leader>ght', gs.toggle_deleted, { desc = "toggle deleted" })

          -- Text object
          map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        end
      }
    end,
    keys = {
      { "<leader>ghd" },
      { "<leader>ghp" },
      { "<leader>ghR" },
      { "<leader>ghr" },
      { "<leader>ghs" },
      { "<leader>ghS" },
      { "<leader>ght" },
      { "<leader>ghu" },
    }
  },

  {
    "sindrets/diffview.nvim",
    lazy = true,
    enabled = true,
    event = "BufRead",
    config = function()
      require("plugins.git.diffview")
    end,
    keys = {
      { "<Leader>gd", "<cmd>lua require('plugins.git.diffview').toggle_file_history()<CR>", desc = "diff file" },
      { "<Leader>gS", "<cmd>lua require('plugins.git.diffview').toggle_status()<CR>",       desc = "status" }
    },
  },

  {
    "akinsho/git-conflict.nvim",
    lazy = false,
    event = "BufRead",
    version = "*",
    config = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "GitConflictDetected",
        callback = function()
          vim.notify("Conflict detected in " .. vim.fn.expand("<afile>"))
        end,
      })

      require("git-conflict").setup({
        default_mappings = true,    -- disable buffer local mapping created by this plugin
        default_commands = true,    -- disable commands created by this plugin
        disable_diagnostics = true, -- This will disable the diagnostics in a buffer whilst it is conflicted
        list_opener = 'copen',      -- command or function to open the conflicts list
        highlights = {              -- They must have background color, otherwise the default color will be used
          incoming = "DiffText",
          current = "DiffAdd",
        },
      })

      vim.api.nvim_set_hl(0, "GitConflictIncoming", { bg = "#293919" })
      vim.api.nvim_set_hl(0, "GitConflictIncomingLabel", { bold = true, bg = "#698F3F" })

    end,
    keys = {
      { "<Leader>gcb", '<cmd>GitConflictChooseBoth<CR>',   desc = 'choose both' },
      { "<Leader>gcn", '<cmd>GitConflictNextConflict<CR>', desc = 'move to next conflict' },
      { "<Leader>gcc", '<cmd>GitConflictChooseOurs<CR>',   desc = 'choose current' },
      { "<Leader>gcp", '<cmd>GitConflictPrevConflict<CR>', desc = 'move to prev conflict' },
      { "<Leader>gci", '<cmd>GitConflictChooseTheirs<CR>', desc = 'choose incoming' },
    }
  },

  {
    "ThePrimeagen/git-worktree.nvim",
    lazy = false,
    config = function()
      require("plugins.git.worktree")
    end,
    opts = {
      change_directory_command = "cd",  -- default: "cd",
      update_on_change = true,          -- default: true,
      update_on_change_command = "e .", -- default: "e .",
      clearjumps_on_change = true,      -- default: true,
      autopush = false,                 -- default: false,
    },
    keys = {
      { "<Leader>gww", desc = "worktrees" },
      { "<Leader>gwc", desc = "create worktree" }
    }
  },

  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    cmd = {
      "Octo",
    },
    config = function()
      local wk = require("which-key")

      require('octo').setup({
        mappings = {
          issue = {
            close_issue = { lhs = "<LocalLeader>ic", desc = "close issue" },
            reopen_issue = { lhs = "<LocalLeader>io", desc = "reopen issue" },
            list_issues = { lhs = "<LocalLeader>il", desc = "list open issues on same repo" },
            reload = { lhs = "R", desc = "reload issue" },
            open_in_browser = { lhs = "B", desc = "open issue in browser" },
            copy_url = { lhs = "<C-y>", desc = "copy url to system clipboard" },
            add_assignee = { lhs = "<LocalLeader>aa", desc = "add assignee" },
            remove_assignee = { lhs = "<LocalLeader>ad", desc = "remove assignee" },
            create_label = { lhs = "<LocalLeader>lc", desc = "create label" },
            add_label = { lhs = "<LocalLeader>la", desc = "add label" },
            remove_label = { lhs = "<LocalLeader>ld", desc = "remove label" },
            goto_issue = { lhs = "<LocalLeader>gi", desc = "navigate to a local repo issue" },
            add_comment = { lhs = "<LocalLeader>ca", desc = "add comment" },
            delete_comment = { lhs = "<LocalLeader>cd", desc = "delete comment" },
            next_comment = { lhs = "]c", desc = "go to next comment" },
            prev_comment = { lhs = "[c", desc = "go to previous comment" },
            react_hooray = { lhs = "<LocalLeader>rp", desc = "add/remove 🎉 reaction" },
            react_heart = { lhs = "<LocalLeader>rh", desc = "add/remove ❤️ reaction" },
            react_eyes = { lhs = "<LocalLeader>re", desc = "add/remove 👀 reaction" },
            react_thumbs_up = { lhs = "<LocalLeader>r+", desc = "add/remove 👍 reaction" },
            react_thumbs_down = { lhs = "<LocalLeader>r-", desc = "add/remove 👎 reaction" },
            react_rocket = { lhs = "<LocalLeader>rr", desc = "add/remove 🚀 reaction" },
            react_laugh = { lhs = "<LocalLeader>rl", desc = "add/remove 😄 reaction" },
            react_confused = { lhs = "<LocalLeader>rc", desc = "add/remove 😕 reaction" },
          },
          pull_request = {
            checkout_pr = { lhs = "<LocalLeader>po", desc = "checkout PR" },
            merge_pr = { lhs = "<LocalLeader>pMm", desc = "merge commit PR" },
            squash_and_merge_pr = { lhs = "<LocalLeader>pMs", desc = "squash and merge PR" },
            list_commits = { lhs = "<LocalLeader>pc", desc = "list PR commits" },
            list_changed_files = { lhs = "<LocalLeader>pf", desc = "list PR changed files" },
            show_pr_diff = { lhs = "<LocalLeader>pd", desc = "show PR diff" },
            add_reviewer = { lhs = "<LocalLeader>va", desc = "add reviewer" },
            remove_reviewer = { lhs = "<LocalLeader>vd", desc = "remove reviewer request" },
            close_issue = { lhs = "<LocalLeader>pmc", desc = "close PR" },
            reopen_issue = { lhs = "<LocalLeader>pmo", desc = "reopen PR" },
            list_issues = { lhs = "<LocalLeader>il", desc = "list open issues on same repo" },
            reload = { lhs = "R", desc = "reload PR" },
            open_in_browser = { lhs = "B", desc = "open PR in browser" },
            copy_url = { lhs = "<C-y>", desc = "copy url to system clipboard" },
            goto_file = { lhs = "gf", desc = "go to file" },
            add_assignee = { lhs = "<LocalLeader>aa", desc = "add assignee" },
            remove_assignee = { lhs = "<LocalLeader>ad", desc = "remove assignee" },
            create_label = { lhs = "<LocalLeader>lc", desc = "create label" },
            add_label = { lhs = "<LocalLeader>la", desc = "add label" },
            remove_label = { lhs = "<LocalLeader>ld", desc = "remove label" },
            goto_issue = { lhs = "<LocalLeader>gi", desc = "navigate to a local repo issue" },
            add_comment = { lhs = "<LocalLeader>ca", desc = "add comment" },
            delete_comment = { lhs = "<LocalLeader>cd", desc = "delete comment" },
            next_comment = { lhs = "]c", desc = "go to next comment" },
            prev_comment = { lhs = "[c", desc = "go to previous comment" },
            react_hooray = { lhs = "<LocalLeader>rp", desc = "add/remove 🎉 reaction" },
            react_heart = { lhs = "<LocalLeader>rh", desc = "add/remove ❤️ reaction" },
            react_eyes = { lhs = "<LocalLeader>re", desc = "add/remove 👀 reaction" },
            react_thumbs_up = { lhs = "<LocalLeader>r+", desc = "add/remove 👍 reaction" },
            react_thumbs_down = { lhs = "<LocalLeader>r-", desc = "add/remove 👎 reaction" },
            react_rocket = { lhs = "<LocalLeader>rr", desc = "add/remove 🚀 reaction" },
            react_laugh = { lhs = "<LocalLeader>rl", desc = "add/remove 😄 reaction" },
            react_confused = { lhs = "<LocalLeader>rc", desc = "add/remove 😕 reaction" },
          },
          review_thread = {
            goto_issue = { lhs = "<LocalLeader>gi", desc = "navigate to a local repo issue" },
            add_comment = { lhs = "<LocalLeader>ca", desc = "add comment" },
            delete_comment = { lhs = "<LocalLeader>cd", desc = "delete comment" },
            add_suggestion = { lhs = "<LocalLeader>sa", desc = "add suggestion" },
            next_comment = { lhs = "]c", desc = "go to next comment" },
            prev_comment = { lhs = "[c", desc = "go to previous comment" },
            select_next_entry = { lhs = "]q", desc = "move to previous changed file" },
            select_prev_entry = { lhs = "[q", desc = "move to next changed file" },
            close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
            react_hooray = { lhs = "<LocalLeader>rp", desc = "add/remove 🎉 reaction" },
            react_heart = { lhs = "<LocalLeader>rh", desc = "add/remove ❤️ reaction" },
            react_eyes = { lhs = "<LocalLeader>re", desc = "add/remove 👀 reaction" },
            react_thumbs_up = { lhs = "<LocalLeader>r+", desc = "add/remove 👍 reaction" },
            react_thumbs_down = { lhs = "<LocalLeader>r-", desc = "add/remove 👎 reaction" },
            react_rocket = { lhs = "<LocalLeader>rr", desc = "add/remove 🚀 reaction" },
            react_laugh = { lhs = "<LocalLeader>rl", desc = "add/remove 😄 reaction" },
            react_confused = { lhs = "<LocalLeader>rc", desc = "add/remove 😕 reaction" },
          },
          submit_win = {
            approve_review = { lhs = "<LocalLeader>sa", desc = "approve review" },
            comment_review = { lhs = "<LocalLeader>sc", desc = "comment review" },
            request_changes = { lhs = "<LocalLeader>sr", desc = "request changes review" },
            close_review_tab = { lhs = "<LocalLeader>sx", desc = "close review tab" },
          },
          review_diff = {
            add_review_comment = { lhs = "<LocalLeader>ca", desc = "add a new review comment" },
            add_review_suggestion = { lhs = "<LocalLeader>sa", desc = "add a new review suggestion" },
            focus_files = { lhs = "<LocalLeader>e", desc = "move focus to changed file panel" },
            toggle_files = { lhs = "<LocalLeader>b", desc = "hide/show changed files panel" },
            next_thread = { lhs = "]t", desc = "move to next thread" },
            prev_thread = { lhs = "[t", desc = "move to previous thread" },
            select_next_entry = { lhs = "]q", desc = "move to previous changed file" },
            select_prev_entry = { lhs = "[q", desc = "move to next changed file" },
            close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
            toggle_viewed = { lhs = "<LocalLeader><space>", desc = "toggle viewer viewed state" },
            goto_file = { lhs = "gf", desc = "go to file" },
          },
          file_panel = {
            next_entry = { lhs = "j", desc = "move to next changed file" },
            prev_entry = { lhs = "k", desc = "move to previous changed file" },
            select_entry = { lhs = "<cr>", desc = "show selected changed file diffs" },
            refresh_files = { lhs = "R", desc = "refresh changed files panel" },
            focus_files = { lhs = "<LocalLeader>f", desc = "move focus to changed file panel" },
            toggle_files = { lhs = "<LocalLeader>b", desc = "hide/show changed files panel" },
            select_next_entry = { lhs = "]q", desc = "move to previous changed file" },
            select_prev_entry = { lhs = "[q", desc = "move to next changed file" },
            close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
            toggle_viewed = { lhs = "<LocalLeader><Space>", desc = "toggle viewer viewed state" },
          }
        }
      })

      local function attach_octo(bufnr)
        wk.add({
          { buffer = bufnr,     mode = { "n", "x" } },
          { "<LocalLeader>a",   "<cmd>Octo assignee<CR>",         desc = "Assignee" },
          { "<LocalLeader>c",   "<cmd>Octo comment<CR>",          desc = "Comment" },
          { "<LocalLeader>g",   "<cmd>Octo goto<CR>",             desc = "Go To" },
          { "<LocalLeader>i",   "<cmd>Octo issue<CR>",            desc = "Issue" },
          { "<LocalLeader>l",   "<cmd>Octo label<CR>",            desc = "Label" },
          { "<LocalLeader>p",   group = "Pull Request" },
          { "<LocalLeader>pr",  "<cmd>Octo pr ready<CR>",         desc = "mark draft as ready to review" },
          { "<LocalLeader>ps",  "<cmd>Octo pr checks<CR>",        desc = "status of all checks" },
          { "<LocalLeader>pm",  "<cmd>Octo pr manage<CR>",        desc = "Manage pull request" },
          { "<LocalLeader>pM",  "<cmd>Octo pr merge<CR>",         desc = "Merge" },
          { "<LocalLeader>r",   "<cmd>Octo reaction<CR>",         desc = "Reaction" },
          { "<LocalLeader>s",   group = "Submit" },
          { "<LocalLeader>t",   group = "Thread" },
          { "<LocalLeader>tr",  "<cmd>Octo thread resolve<CR>",   desc = "resolve thread" },
          { "<LocalLeader>tu",  "<cmd>Octo thread unresolve<CR>", desc = "unresolve thread" },
          { "<LocalLeader>v",   "<cmd>Octo reviewer<CR>",         desc = "Reviewer" },
          { "<LocalLeader>R",   group = "Review" },
          { "<LocalLeader>Rs",  "<cmd>Octo review start<CR>",     desc = "start review" },
          { "<LocalLeader>Rr",  "<cmd>Octo review resume<CR>",    desc = "resume" },
          { "<LocalLeader>Rm",  group = "Manage Review" },
          { "<LocalLeader>Rmd", "<cmd>Octo review discard<CR>",   desc = "delete pending review" },
          { "<LocalLeader>Rms", "<cmd>Octo review submit<CR>",    desc = "submit review" },
          { "<LocalLeader>Rmc", "<cmd>Octo review comments<CR>",  desc = "view pending comments" },
          { "<LocalLeader>Rmp", "<cmd>Octo review commit<CR>",    desc = "pick a commit" },
        })
      end


      -- Review buffer
      local function attach_conf(bufnr)
        wk.add({
          { buffer = bufnr,   mode = { "n", "x", "v" } },
          { "<LocalLeader>c", desc = "Comment" },
          { "<LocalLeader>s", desc = "Suggestion" },
          { "<LocalLeader>q", "<cmd>Octo review close<CR>", desc = "quit review" },
        })
      end

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "octo",
        callback = function() attach_octo(0) end
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "conf",
        callback = function() attach_conf(0) end
      })
    end,
  },

  {
    'linrongbin16/gitlinker.nvim',
    config = function()
      require('gitlinker').setup()
    end,
    keys = {
      { "<Leader>gL", "<cmd>GitLink<CR>", mode = "x", desc = "get url for selection" }
    },
    cmd = "GitLink",
  },
}
