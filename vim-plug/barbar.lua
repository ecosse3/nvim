let bufferline = {}

function bufferline#highlight#setup()
   let fg_target = 'red'

   let fg_current  = s:fg(['Normal'], '#efefef')
   let fg_visible  = s:fg(['TabLineSel'], '#efefef')
   let fg_inactive = s:fg(['TabLineFill'], '#888888')

   let fg_modified  = s:fg(['WarningMsg'], '#E5AB0E')
   let fg_special  = s:fg(['Special'], '#599eff')
   let fg_subtle  = s:fg(['NonText', 'Comment'], '#555555')

   let bg_current  = s:bg(['Normal'], '#000000')
   let bg_visible  = s:bg(['TabLineSel', 'Normal'], '#000000')
   let bg_inactive = s:bg(['TabLineFill', 'StatusLine'], '#000000')

   "      Current: current buffer
   "      Visible: visible but not current buffer
   "     Inactive: invisible but not current buffer
   "         -Mod: when modified
   "        -Sign: the separator between buffers
   "      -Target: letter in buffer-picking mode
   call s:hi_all([
   \ ['BufferCurrent',        fg_current,  bg_current],
   \ ['BufferCurrentMod',     fg_modified, bg_current],
   \ ['BufferCurrentSign',    fg_special,  bg_current],
   \ ['BufferCurrentTarget',  fg_target,   bg_current,   'bold'],
   \ ['BufferVisible',        fg_visible,  bg_visible],
   \ ['BufferVisibleMod',     fg_modified, bg_visible],
   \ ['BufferVisibleSign',    fg_visible,  bg_visible],
   \ ['BufferVisibleTarget',  fg_target,   bg_visible,   'bold'],
   \ ['BufferInactive',       fg_inactive, bg_inactive],
   \ ['BufferInactiveMod',    fg_modified, bg_inactive],
   \ ['BufferInactiveSign',   fg_subtle,   bg_inactive],
   \ ['BufferInactiveTarget', fg_target,   bg_inactive,  'bold'],
   \ ])
endfunc
