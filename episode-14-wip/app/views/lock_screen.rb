class LockScreen < UIView

  attr_reader :rmq, :digit1, :digit2, :digit3, :digit4, :label
  attr_accessor :text

  def style_for_controller(controller)
    @rmq = controller.rmq(self)

    @label = rmq.append(UILabel, :lock_screen_text).each { |l| l.text = @text }

    @digit_block =  rmq.append(UIView, :lock_screen_digit_block)
    @digit1 = @digit_block.append(UITextField, :lock_screen_digit_1)
    @digit2 = @digit_block.append(UITextField, :lock_screen_digit_2)
    @digit3 = @digit_block.append(UITextField, :lock_screen_digit_3)
    @digit4 = @digit_block.append(UITextField, :lock_screen_digit_4)
  end

end

