class ManageLockCodeController < UIViewController

  def initAndSetCode
    if init
      @text = "Enter a new code"
      @action = -> (code) do
        controller = ManageLockCodeController.alloc.initAndConfirmCode code
        self.navigationController.pushViewController(controller, animated: true)
      end
    end

    self
  end

  def initAndConfirmCode input_code
    if init
      @text = "Confirm your new code"
    end

    self
  end

  def viewDidLoad
    super
    rmq.stylesheet = ManageLockCodeStylesheet

    @lock_screen = rmq.append(LockScreen, :lock_screen).get
    @lock_screen.text = @text
    @lock_screen.style_for_controller(self)
    @lock_screen.action_on_last_button = @action
  end

end

