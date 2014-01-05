class BackspaceDetectingUITextField < UITextField

  def deleteBackward
    super

    if @on_backspace
      @on_backspace.call(self)
    end
  end

  def sanitize_data
    if text.size > 1
      self.text = text[text.size - 1, 1]
    end
  end

  def on_backspace(&block)
    @on_backspace = block
  end
end

class LockScreen < UIView

  attr_reader :rmq, :digit1, :digit2, :digit3, :digit4, :label
  attr_accessor :text

  def style_for_controller(controller)
    @rmq = controller.rmq(self)

    @label = rmq.append(UILabel, :lock_screen_text).each { |l| l.text = @text }

    @digit_block =  rmq.append(UIView, :lock_screen_digit_block)
    @digit1 = @digit_block.append(BackspaceDetectingUITextField, :lock_screen_digit_1)
    @digit2 = @digit_block.append(BackspaceDetectingUITextField, :lock_screen_digit_2)
    @digit3 = @digit_block.append(BackspaceDetectingUITextField, :lock_screen_digit_3)
    @digit4 = @digit_block.append(BackspaceDetectingUITextField, :lock_screen_digit_4)

    bind_fields_to_events
  end

  def bind_fields_to_events
    setup_pair(digit1, digit2)
    setup_pair(digit2, digit3)
    setup_pair(digit3, digit4)

    digit1.get.becomeFirstResponder
  end


  def setup_pair(left, right)
    left.on(:change) do |field| 
      field.sanitize_data
      right.get.becomeFirstResponder unless field.text == ""
    end

    right.get.on_backspace do |field| 
      field.text = ""
      left.get.text = ""
      left.get.becomeFirstResponder
    end
  end

end
