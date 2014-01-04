class ManageLockCodeController < UIViewController

  def initAndSetCode
    if init
      @text = "Enter a new code"
    end

    self
  end

  def viewDidLoad
    super
    rmq.stylesheet = ManageLockCodeStylesheet

    @lock_screen = rmq.append(LockScreen, :lock_screen).get
    @lock_screen.text = @text
    @lock_screen.style_for_controller(self)
  end

end

