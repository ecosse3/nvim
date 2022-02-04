; Use HTML syntax highlighting in template for vue.js
; template: `<html>`
(pair
  key: (property_identifier) @_name
    (#eq? @_name "template")
  value: (template_string) @html
)
