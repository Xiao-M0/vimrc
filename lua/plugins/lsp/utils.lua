local M = {}

M.ends_with = function(str, ending)
  return ending == "" or string.sub(str, - #ending) == ending
end

M.exists = function(file)
  local ok, err, code = os.rename(file, file)
  if not ok then
    if code == 13 then
      return true
    end
  end
  return ok, err
end

return M
