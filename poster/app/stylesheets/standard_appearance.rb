class StandardAppearance
  class << self
    def set_named_fonts_and_colors
      rmq = RubyMotionQuery::RMQ
      font = rmq.font
      color = rmq.color

      font_family = 'HelveticaNeue-Light'
      font_family_large = 'HelveticaNeue-UltraLight'
      font.add_named :huge,           font_family_large, 48
      font.add_named :larger,         font_family_large, 30
      font.add_named :large,          font_family, 20
      font.add_named :medium,         font_family, 16
      font.add_named :small,          font_family, 12
      font.add_named :tiny,           font_family, 9

      color.add_named :tint_color,     '3F5C7A'

      color.add_named :olive_green,    '838E61'
      color.add_named :charcoal_gray,  '262626'
      color.add_named :dim_gray,       '7F7F7F'
      color.add_named :light_gray,     'F1F1F1'
      color.add_named :border_color,   'DDDDDD'
      color.add_named :burnt_orange,   'D56217'
      color.add_named :light_peach,    color.from_rgba(250, 57, 66, 0.330)
    end
  end

end
