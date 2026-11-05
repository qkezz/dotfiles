-- ~/.config/nvim/init.lua

local opt = vim.opt

--opt.shortmess:append("I")


opt.langmap = "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,"
           .. "фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"

opt.expandtab   = true
opt.smarttab    = true
opt.tabstop     = 4
opt.softtabstop = 4
opt.shiftwidth  = 4
opt.cursorline = true
opt.incsearch = true
opt.number = true
opt.mouse  = "a"
opt.list      = true
opt.listchars = { tab = "»-", space = "⋅", trail = "·", nbsp = "±" }

vim.cmd("syntax on")

local function apply_user_hl()
  vim.api.nvim_set_hl(0, "NonText",    { ctermfg = "gray" })
  vim.api.nvim_set_hl(0, "SpecialKey", { ctermfg = "gray" })
end

apply_user_hl()

vim.api.nvim_create_autocmd("ColorScheme", {
  group    = vim.api.nvim_create_augroup("UserHighlights", { clear = true }),
  callback = apply_user_hl,
})

local map = vim.keymap.set

map("n", "<F2>",   ":set list!<CR>",           { desc = "Переключить listchars" })
map("n", "<F14>", ":set relativenumber!<CR>", { desc = "Переключить relativenumber" })
map("n", " so", ":source %<CR>")
map("n", "<Tab>",  "I    <Esc>",               { desc = "Вставить 4 пробела в начало строки" })
map({"n", "v"}," p", "\"+p")
map({"n", "v"}," y", "\"+y")

vim.api.nvim_create_user_command("Html5", function()
  local lines = {
    "<!DOCTYPE html>",
    '<html lang="en">',
    "<head>",
    '    <meta charset="UTF-8">',
    '    <meta name="viewport" content="width=device-width, initial-scale=1.0">',
    "    <title>Document</title>",
    "</head>",
    "<body>",
    "    ",
    "</body>",
    "</html>",
  }
  local row = vim.fn.line(".") - 1
  vim.api.nvim_buf_set_lines(0, row, row, false, lines)
end, { desc = "Вставить HTML5-шаблон над текущей строкой" })

vim.api.nvim_create_user_command("Linkcss", function()
  vim.cmd([[normal! a<link rel="stylesheet" href="style.css">]])
end, { desc = "Вставить <link> на style.css в позиции курсора" })

require("rose-pine").setup({
  variant      = "moon",   -- main | moon | dawn
  dark_variant = "moon",   -- какой вариант брать, когда background=dark
  styles = {
    italic       = true,
    transparency = false,  -- поставь true, если хочешь прозрачный фон терминала
  },
})
vim.cmd.colorscheme("rose-pine")

require("nvim-treesitter").setup()

require("nvim-treesitter").install({
  "lua", "vim", "vimdoc", "query",
  "bash", "python", "html", "css", "javascript", "json", "markdown",
})

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
    if lang and pcall(vim.treesitter.start, args.buf, lang) then
      -- Treesitter-фолды и indent (по желанию)
      vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
      vim.bo[args.buf].indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
    end
  end,
})
