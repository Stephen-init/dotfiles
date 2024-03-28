return {
  black = 0xff24273a,
  white = 0xffc6a0f6,
  red = 0xffeed49f,
  green = 0xffa6da95,
  blue = 0xff7dc4e4,
  yellow = 0xffcad3f5,
  orange = 0xffb7bdf8,
  magenta = 0xffcad3f5,
  grey = 0xfff4dbd6,
  transparent = 0x00000000,

  bar = {
    bg =0xff24273a,
    border = transparent,
  },
  popup = {
    bg = 0xc02c2e34,
    border = 0xff7f8490
  },
  bg1 = 0xff494d64,
  bg2 = 0xff494d64,

  with_alpha = function(color, alpha)
    if alpha > 1.0 or alpha < 0.0 then return color end
    return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
  end,
}
