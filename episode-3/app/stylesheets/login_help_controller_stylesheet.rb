class LoginHelpControllerStylesheet < ApplicationStylesheet

  SUPPORT_EMAIL_ADDRESS = 'support@bigbinary.com'
  EMAIL_SUBJECT = 'LRM - Login help'

  def root_view(st)
    st.background_color = color.light_gray
  end

  def form(st)
    st.frame = {w: 260, h: 370}
    st.centered = :both
  end

  def fields(st)
    st.frame = {l: 0, t: 0, w: 260, h: 30}
    st.centered = :horizontal
  end

  def help_title_label(st)
    standard_label_title st
    fields st
    st.height = 60
    st.text = 'Can\'t log in? Forget your password?'
    st.number_of_lines = :unlimited
  end
  def help_note_label(st)
    standard_label_note st
    fields st
    st.frame = {t: 45, h: 80}
    st.text = 'Enter your email address below and we\'ll send you password reset instructions'
  end

  def email(st)
    fields st
    st.frame = {t: 125}
    st.view.tap do |view|
      view.placeholder = 'Enter your email address'
      view.clearButtonMode = UITextFieldViewModeWhileEditing
      view.keyboardType = UIKeyboardTypeEmailAddress
      view.font = font.large
      view.borderStyle = UITextBorderStyleRoundedRect
      view.autocorrectionType = UITextAutocorrectionTypeNo
    end
  end

  def send_button(st)
    standard_button st
    fields st
    st.frame = {t: 165}
    st.text = 'Send me reset instructions'
  end

  def cancel_button(st)
    standard_button_as_link st
    fields st
    st.frame = {t: 212}
    st.text = 'Nevermind, go back to log in'
  end

  def more_help_title_label(st)
    standard_label_title st
    fields st
    st.frame = {t: 250}
    st.text = 'Need more help?'
  end

  def more_help_note_label(st)
    standard_label_note st
    fields st
    st.frame = {t: 265, h: 90}
    st.text = 'To ge in touch with our friendly support team, just send an email to'
    st.number_of_lines = :unlimited
  end

  def more_help_button(st)
    standard_button_as_link st
    st.frame = {l: 21, t: 316, w: 230, h: 30} 
    st.text = SUPPORT_EMAIL_ADDRESS
  end

end

