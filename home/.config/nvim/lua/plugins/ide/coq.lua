return {
  {
    -- Main coq
    "ms-jpq/coq_nvim",
    branch = "coq",
    cond = not VSCODE,
    init = function ()
      vim.g.coq_settings = {
        auto_start = "shut-up",
        -- keymap = { }
      }
    end,
    dependencies = {
    }
  },
  {
    -- Snippets
    "ms-jpq/coq.artifacts",
    branch = "artifacts",
  },
  {
    -- Third party
    "ms-jpq/coq.thirdparty",
    branch = "3p",
    config = function()
      require("coq_3p") {
        -- Built in
        { src = "builtin/ada"     },
        { src = "builtin/c"       },
        { src = "builtin/clojure" },
        { src = "builtin/css"     },
        { src = "builtin/haskell" },
        { src = "builtin/html"    },
        { src = "builtin/js"      },
        { src = "builtin/php"     },
        { src = "builtin/syntax"  },
        { src = "builtin/xml"     },

        { src = "nvimlua", short_name = "nLUA", conf_only = true },
        { src = "vimtex",  short_name = "vTEX" },

        { src = "bc", short_name = "MATH", precision = 6 }
      }
    end,
  },
}
