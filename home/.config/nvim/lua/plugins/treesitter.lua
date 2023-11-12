---@param opts TSConfig
function config(_, opts)
  if type(opts.ensure_installed) == "table" then
    ---@type table<string, boolean>
    local added = {}
    opts.ensure_installed = vim.tbl_filter(function(lang)
      if added[lang] then
        return false
      end
      added[lang] = true
      return true
    end, opts.ensure_installed)
  end
  require("nvim-treesitter.configs").setup(opts)
end


return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TSUpdateSync" },
  opts = {
    highlight = { enable = not VSCODE },
    indent = { enable = true },
    ensure_installed = {
      -- "ada",
      -- "agda",
      -- "apex",
      -- "arduino",
      -- "astro",
      -- "authzed",
      "awk",
      "bash",
      -- "bass",
      -- "beancount",
      "bibtex",
      -- "bicep",
      -- "bitbake",
      -- "blueprint",
      "c",
      "c_sharp",
      -- "cairo",
      -- "capnp",
      -- "chatito",
      -- "clojure",
      "cmake",
      "comment",
      -- "commonlisp",
      -- "cooklang",
      -- "corn",
      -- "cpon",
      "cpp",
      "css",
      "csv",
      "cuda",
      -- "cue",
      -- "d",
      -- "dart",
      -- "devicetree",
      -- "dhall",
      "diff",
      "dockerfile",
      "dot",
      "doxygen",
      -- "dtd",
      -- "ebnf",
      -- "eds",
      -- "eex",
      -- "elixir",
      -- "elm",
      -- "elsa",
      -- "elvish",
      -- "embedded_template",
      -- "erlang",
      -- "fennel",
      -- "firrtl",
      "fish",
      -- "foam",
      -- "forth",
      -- "fortran",
      -- "fsh",
      -- "func",
      -- "fusion",
      -- "gdscript",
      "git_rebase",
      "gitattributes",
      "gitcommit",
      "git_config",
      "gitignore",
      -- "gleam",
      -- "glimmer",
      -- "glsl",
      -- "gn",
      -- "go",
      -- "godot_resource",
      -- "gomod",
      -- "gosum",
      -- "gowork",
      "gpg",
      -- "groovy",
      -- "graphql",
      -- "gstlaunch",
      -- "hack",
      -- "hare",
      "haskell",
      "haskell_persistent",
      -- "hcl",
      -- "heex",
      -- "hjson",
      -- "hlsl",
      -- "hocon",
      -- "hoon",
      "html",
      -- "htmldjango",
      "http",
      -- "hurl",
      "ini",
      -- "ispc",
      -- "janet_simple",
      "java",
      "javascript",
      -- "jq",
      "jsdoc",
      "json",
      "json5",
      "jsonc",
      -- "jsonnet",
      -- "julia",
      -- "kconfig",
      -- "kdl",
      "kotlin",
      -- "lalrpop",
      "latex",
      -- "ledger",
      -- "leo",
      "llvm",
      -- "liquidsoap",
      "lua",
      "luadoc",
      "luap",
      "luau",
      -- "m68k",
      "make",
      "markdown",
      "markdown_inline",
      -- "matlab",
      -- "menhir",
      "mermaid",
      -- "meson",
      -- "mlir",
      -- "nasm",
      -- "nickel",
      "ninja",
      -- "nix",
      -- "norg",
      -- "nqc",
      -- "objc",
      "objdump",
      -- "ocaml",
      -- "ocaml_interface",
      -- "ocamllex",
      -- "odin",
      -- "org",
      -- "pascal",
      -- "passwd",
      -- "pem",
      -- "perl",
      -- "php",
      -- "phpdoc",
      -- "pioasm",
      -- "po",
      -- "pod",
      -- "poe_filter",
      -- "pony",
      -- "prisma",
      -- "promql",
      -- "proto",
      -- "prql",
      -- "psv",
      -- "pug",
      -- "puppet",
      -- "pymanifest",
      "python",
      -- "ql",
      -- "qmldir",
      -- "qmljs",
      "query",
      -- "r",
      -- "racket",
      -- "rasi",
      -- "re2c",
      "regex",
      -- "rego",
      "requirements",
      -- "rnoweb",
      -- "robot",
      -- "ron",
      -- "rst",
      "ruby",
      "rust",
      -- "scala",
      -- "scfg",
      -- "scheme",
      "scss",
      -- "slint",
      -- "smali",
      -- "snakemake",
      -- "smithy",
      -- "solidity",
      -- "soql",
      -- "sosl",
      -- "sparql",
      "sql",
      -- "squirrel",
      "ssh_config",
      -- "starlark",
      "strace",
      -- "supercollider",
      -- "surface",
      -- "svelte",
      -- "swift",
      -- "sxhkdrc",
      -- "systemtap",
      -- "t32",
      -- "tablegen",
      -- "teal",
      -- "terraform",
      -- "textproto",
      -- "thrift",
      -- "tiger",
      -- "tlaplus",
      -- "todotxt",
      "toml",
      -- "tsv",
      -- "tsx",
      -- "turtle",
      -- "twig",
      "typescript",
      -- "typoscript",
      -- "ungrammar",
      -- "unison",
      -- "usd",
      -- "uxntal",
      -- "v",
      -- "vala",
      -- "verilog",
      -- "vhs",
      "vim",
      "vimdoc",
      -- "vue",
      -- "wgsl",
      -- "wgsl_bevy",
      -- "wing",
      "xml",
      "yaml",
      -- "yang",
      -- "yuck",
      -- "zig",
    },
  },
  config = config
}
