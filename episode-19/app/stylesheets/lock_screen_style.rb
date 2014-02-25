module LockScreenStyle

  SIZE = 60
  BUFFER = SIZE * 0.25
  FULL = SIZE + BUFFER

  def lock_screen(st)
    st.frame = :full
    st.background_color = color.light_gray
  end

  def lock_screen_text(st)
    st.font = font.larger
    st.top = 100
    st.width = 400
    st.height = 50
    st.centered = :horizontal
    st.text_alignment = :center
  end

  def lock_screen_digit_block(st)
    if device.four_inch?
      st.top = 165
    else
      st.top = 160
    end

    st.height = SIZE
    st.width = BUFFER + FULL * 4
    st.centered = :horizontal
  end

  def lock_screen_digit_1(st)
    lock_screen_digit(st)
    st.left = BUFFER
  end

  def lock_screen_digit_2(st)
    lock_screen_digit(st)
    st.left = BUFFER + FULL
  end

  def lock_screen_digit_3(st)
    lock_screen_digit(st)
    st.left = BUFFER + FULL * 2
  end

  def lock_screen_digit_4(st)
    lock_screen_digit(st)
    st.left = BUFFER + FULL * 3
  end

  private

  def lock_screen_digit(st)
    st.width = SIZE
    st.height = SIZE
    st.view.font = font.huge
    st.view.keyboardType = UIKeyboardTypeDecimalPad
    st.view.borderStyle = UITextBorderStyleRoundedRect
    st.view.textAlignment = NSTextAlignmentCenter
    st.view.secureTextEntry = true
  end

end

