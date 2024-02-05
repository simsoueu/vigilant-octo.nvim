local util = require("vigilant-octo.util")
local theme = require("vigilant-octo.theme")
local config = require("vigilant-octo.config")

local M = {}

function M._load(style)
  if style and not M._style then
    M._style = require("vigilant-octo.config").options.style
  end
  if not style and M._style then
    require("vigilant-octo.config").options.style = M._style
    M._style = nil
  end
  M.load({ style = style, use_background = style == nil })
end

---@param opts Config|nil
function M.load(opts)
  if opts then
    require("vigilant-octo.config").extend(opts)
  end
  util.load(theme.setup())
end

M.setup = config.setup

-- keep for backward compatibility
M.colorscheme = M.load

return M
