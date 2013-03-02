--[[
Copyright Tomaz Muraus

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS-IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
--]]

local LineEmitter = require('../lib/emitter').LineEmitter

local exports = {}

exports['test_line_emitter_single_chunk'] = function(test, asserts)
  local count = 0
  local lines = {'test1', 'test2', 'test3', 'test4'}
  local le = LineEmitter:new()

  le:on('data', function(line)
    count = count + 1
    asserts.equals(line, lines[count])

    if count == 4 then
      test.done()
    end
  end)

  le:write('test1\ntest2\ntest3\ntest4\n')
end

exports['test_line_emitter_multiple_chunks'] = function(test, asserts)
  local count = 0
  local lines = {'test1', 'test2', 'test3', 'test4', 'test5'}
  local le = LineEmitter:new()

  le:on('data', function(line)
    count = count + 1
    asserts.equals(line, lines[count])

    if count == 5 then
      test.done()
    end
  end)

  le:write('test1\n')
  le:write('test2\n')
  le:write('test3\n')
  le:write('test4\ntest5')
  le:write('\n')
end

exports['test_line_emitter_multiple_chunks_includeNewLine'] = function(test, asserts)
  local count = 0
  local lines = {'test1\n', 'test2\n', 'test3\n', 'test4\n', 'test5\n'}
  local le = LineEmitter:new('', {includeNewLine = true})

  le:on('data', function(line)
    count = count + 1
    asserts.equals(line, lines[count])

    if count == 5 then
      test.done()
    end
  end)

  le:write('test1\n')
  le:write('test2\n')
  le:write('test3\n')
  le:write('test4\ntest5')
  le:write('\n')
end

return exports
