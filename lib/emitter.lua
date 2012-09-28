local iStream = require('core').iStream

local exports = {}

local LineEmitter = iStream:extend()

function LineEmitter:initialize(initialBuffer, options)
  options = options and options or {}
  self._buffer = initialBuffer and initialBuffer or ''
  self._includeNewLine = options['includeNewLine']
end

function LineEmitter:write(chunk)
  local line

  self._buffer = self._buffer .. chunk

  line = self:_popLine()
  while line do
    self:emit('data', line)
    line = self:_popLine()
  end
end

function LineEmitter:_popLine()
  local line = false
  local index = self._buffer:find('\n')

  if index then
    line = self._buffer:sub(0, index - 1)

    if self._includeNewLine then
      line = line .. '\n'
    end

    self._buffer = self._buffer:sub(index + 1)
  end

  return line
end

exports.LineEmitter = LineEmitter
return exports
