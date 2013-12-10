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

class ApplicationStylesheet < RubyMotionQuery::Stylesheet
  def standard_button(st)
    st.height = 35
    st.color = color.white
    st.background_color = color.tint_color
    st.view.font = font.large
  end

  def standard_button_as_link(st)
    st.height = 35
    st.color = color.tint_color
    st.view.titleLabel.lineBreakMode = NSLineBreakByWordWrapping
    st.view.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft
  end

  def standard_label_title(st)
    st.number_of_lines = :unlimited
    st.height = 30
  end

  def standard_label_note(st)
    st.number_of_lines = :unlimited
    st.height = 50
    st.color = color.gray
  end

end


class Loginv3ControllerStylesheet < ApplicationStylesheet

  def root_view(st)
    st.background_color = color.brown
  end

  def login_button(st)
    fields st
    standard_button st
    st.top = 140
    st.text = 'Login'
  end

  def email(st)
    fields st
    st.top = 60
    st.view.tap do |view|
      view.placeholder = 'Your email address'
      view.clearButtonMode = UITextFieldViewModeWhileEditing
      view.keyboardType = UIKeyboardTypeEmailAddress
      view.borderStyle = UITextBorderStyleRoundedRect
      view.autocorrectionType = UITextAutocorrectionTypeNo
    end
  end

  def password(st)
    fields st
    st.top = 100
    st.view.tap do |view|
      view.placeholder = 'Your password'
      view.clearButtonMode = UITextFieldViewModeWhileEditing
      st.view.secureTextEntry = true
      view.borderStyle = UITextBorderStyleRoundedRect
      view.autocorrectionType = UITextAutocorrectionTypeNo
    end
  end

  def fields(st)
    st.frame = {l: 0, t: 0, w: 260, h: 30}
    st.centered = :horizontal
    st.background_color = color.white
  end


  def login_form(st)
    st.frame = {t: 30, w: 200, h: 250}
    st.centered = :horizontal
  end

end
