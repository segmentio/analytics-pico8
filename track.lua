do
  local chars = ' !"#%\'()*+,-./0123456789:;<=>?abcdefghijklmnopqrstuvwxyz[]^_{~}'

  -- generate char-to-num map.
  local charset = {}
  for i=1,#chars do
    charset[sub(chars,i,i)] = i
  end

  local start  = 0x5f80
  local offset = 0

  local function check()
    if start+offset > 0x5fff then assert(false, 'event is too large.') end
  end

  local function write_char(ch)
    check()
    poke(start+offset, charset[ch])
    offset += 1
  end

  local function write_bool(b)
    check()
    poke(start+offset, b and 1 or 0)
    offset += 1
  end

  local function write_uint8(n)
    check()
    poke(start+offset, n)
    offset += 1
  end

  local function flush()
    check()
    poke(start+offset, 255)
    offset = 0
  end

  local function write_str(s)
    write_uint8(#s)
    for i=1,#s do write_char(sub(s,i,i)) end
  end

  function track(event, properties)
    write_str(event)
    if properties == nil then
      flush()
      return
    end
    for k,v in pairs(properties) do
      write_str(k)
      if type(v) == 'boolean' then
        write_uint8(0)
        write_bool(v)
      elseif type(v) == 'number' then
        write_uint8(1)
        write_str(tostr(v))
      elseif type(v) == 'string' then
        write_uint8(2)
        write_str(v)
      else
        assert(false, k .. ' must be a primitive.')
      end
    end
    flush()
  end
end
