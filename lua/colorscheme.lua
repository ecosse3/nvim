local present, gruvbox = pcall(require, "gruvbox")
if not present then
  return
end

gruvbox.setup({
  dim_inactive = true,
  transparent_mode = false,
  inverse = true,
  contrast = "soft",
})

vim.cmd("colorscheme gruvbox")
