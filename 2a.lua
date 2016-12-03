-- see if the file exists
function file_exists(file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end

-- get all lines from a file, returns an empty
-- list/table if the file does not exist
function lines_from(file)
  if not file_exists(file) then return {} end
  lines = {}
  for line in io.lines(file) do
    lines[#lines + 1] = line
  end
  return lines
end

local file = '2-input.txt'
local lines = lines_from(file)
local up = 1
local right = 1
local keypad = {
  ['2,0'] = 1, ['2,1'] = 2, ['2,2'] = 3,
  ['1,0'] = 4, ['1,1'] = 5, ['1,2'] = 6,
  ['0,0'] = 7, ['0,1'] = 8, ['0,2'] = 9
}
local result = ''

for k,v in pairs(lines) do
  for c in v:gmatch"." do
    if c == 'U' and up < 2 then
      up = up + 1
    end
    if c == 'D' and up > 0 then
      up = up - 1
    end
    if c == 'R' and right < 2 then
      right = right + 1
    end
    if c == 'L' and right > 0 then
      right = right - 1
    end
  end
  result = result .. keypad[up .. ',' .. right]
end
print(result)
