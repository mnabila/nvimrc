local M = {}

function M.char_to_hex(c)
    return string.format("%%%02X", string.byte(c))
end

function M.hex_to_char(x)
    return string.char(tonumber(x, 16))
end

function M.urlencode(url)
    if url == nil then
        return
    end
    url = url:gsub("\n", "\r\n")
    url = url:gsub("([^%w ])", char_to_hex)
    url = url:gsub(" ", "+")
    return url
end

function M.urldecode(url)
    if url == nil then
        return
    end
    url = url:gsub("+", " ")
    url = url:gsub("%%(%x%x)", hex_to_char)
    return url
end


return M
