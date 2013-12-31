class Loginv6ControllerStylesheet < ApplicationStylesheet

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

  def help_label(st)
    st.frame = {l: 0, t: 201, w: 50, h: 20}
    st.text = 'Help:'
  end

  def help_button(st)
    standard_button_as_link st
    st.frame = {l: 45, t: 197, w: 210, h: 50}
    st.text = "I can't log in or I forgot my email/password"
  end

end
