class ScreenLockStylesheet < ApplicationStylesheet

  include LockScreenStyle

  def logout_button(st)
    if device.four_inch?
      st.top = 245
    else
      st.top = 225
    end
    st.width = 120
    st.height = 30
    st.font = font.large_bolder
    st.centered = :horizontal
    st.view.titleLabel.textAlignment = NSTextAlignmentCenter
    st.text = "Logout"
    st.color = color.blue
  end

end

