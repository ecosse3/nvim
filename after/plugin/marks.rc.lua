local present, marks = pcall(require, "marks")
if not present then
  return
end

marks.setup({
  default_mappings = false,
  mappings = {
    set_next = "m,",
    next = "m]",
    preview = "m:",
    prev = false -- pass false to disable only this default mapping
  }
})
