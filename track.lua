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
    -- we use byte 0x5fff for "flushing" the event.
    if start+offset > 0x5ffe then assert(false, 'event is too large.') end
  end

  local function write_char(ch)
    check()
    poke(start+offset, charset[ch])
    offset += 1
  end

  local function write_bool(b)
    check()
    poke(start+offset, b and 255 or 0)
    offset += 1
  end

  local function write_num(n)
    local s = tostr(n)
    for i=1,#s do
      write_char(sub(s,i,i))
    end
  end

  local function write_str(s)
    write_num(#s)
    for i=1,#s do
      write_char(sub(s,i,i))
    end
  end

  local function flush()
    poke(start+offset, 255)
    offset = 0
  end

  function track(event, properties)
    write_str(event)

    if properties == nil then
      return
    end

    for k,v in pairs(properties) do
      write_str(k)
      if     type(v) == 'boolean' then write_bool(v)
      elseif type(v) == 'number'  then write_num(v)
      elseif type(v) == 'string'  then write_str(v)
      else   assert(false, k .. ' must be a primitive.') end
    end

    flush()
  end
end
