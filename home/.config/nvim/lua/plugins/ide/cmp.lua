-- <https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#safely-select-entries-with-cr>
local function on_enter(fallback)
  local cmp = require("cmp")

  if cmp.visible() and cmp.get_active_entry() then
    cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
  else
    fallback()
  end
end

-- <https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#intellij-like-mapping>
local function on_tab(fallback)
  local cmp = require("cmp")

  -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
  if cmp.visible() then
    local entry = cmp.get_selected_entry()
    if not entry then
      cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
    else
      cmp.confirm()
    end

    return
  end

  fallback()
end


local function config()
  local cmp = require("cmp")
  local lspkind = require("lspkind")

  cmp.setup({
    enabled = function()
      return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
          or require("cmp_dap").is_dap_buffer()
    end,
    formatting = {
      format = lspkind.cmp_format({
        mode = "symbol_text",
        menu = ({
          async_path = "[Path]",
          buffer = "[Buffer]",
          ctags = "[CTags]",
          doxygen = "[Doxygen]",
          dynamic = "[Dynamic]",
          nvim_lsp = "[LSP]",
          nvim_lsp_document_symbol = "[DocSymbol]",
          nvim_lua = "[NvimLua]",
          omni = "[Omni]",
          plugins = "[Plug]",
          spell = "[Spell]",
          treesitter = "[Tree]",
        }),
        maxwidth = 50,
        ellipsis_char = "...",
        before = function (entry, vim_item)
          return vim_item
        end
      })
    },
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered()
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<TAB>"] = cmp.mapping(
        on_tab,
        {"i","s","c",}
      ),
      ["<CR>"] = cmp.mapping({
        i = on_enter,
        s = cmp.mapping.confirm({ select = false }),
        c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
      }),
    }),
    sources = cmp.config.sources(
      {
        -- { name = 'nvim_lsp_signature_help' },
        {name = "ctags"},
        {name = "omni"},
        {name = "nvim_lsp"},
        {name = "treesitter", max_item_count = 5},
        {name = "vsnip", max_item_count = 5},
      },
      {
        {name = "async_path", max_item_count = 5},
        {name = "buffer", max_item_count = 5},
        {name = "buffer-lines", max_item_count = 5},
        { name = "spell", keyword_length = 4, max_item_count = 5 },
        {name = "doxygen"},
        --{name = "dynamic"},
        -- {name = "cmp_yanky"},
      }
    ),
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won"t work anymore).
  cmp.setup.cmdline({"/", "?"}, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources(
      {
        {name = "nvim_lsp_document_symbol"}
      },
      {
        {name = "buffer"}
      }
    )
  })

  -- Use cmdline & path source for ":" (if you enabled `native_menu`, this won"t work anymore).
  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources(
      {
        {name = "nvim_lsp_document_symbol"}
      },
      {{name = "path"}},
      {{name = "cmdline"}})
  })

  require("configs.cmp.dap").sources()
  require("configs.cmp.git").sources()
  require("configs.cmp.lua").sources()
end


return {
  "hrsh7th/nvim-cmp",
  cond = not VSCODE,
  config = config,
  event = { "InsertEnter", "CmdlineEnter" },
  dependency = {
    "onsails/lspkind.nvim"
  }
}

