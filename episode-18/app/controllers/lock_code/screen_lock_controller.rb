class ScreenLockController < UIViewController

  DEFAULT_TEXT = "Enter code to unlock"
  TRY_AGAIN_TEXT = "Please try again"

  def initWithText(text)
    if init
      @text = text
    end

    self
  end

  def viewDidLoad
    rmq.stylesheet = ScreenLockStylesheet

    @attempts = 0

    lock_screen = rmq.append(LockScreen, :lock_screen).get
    lock_screen.text = DEFAULT_TEXT
    lock_screen.style_for_controller(self)

    lock_screen.action_on_last_button = -> (code) do
      (LockCode.enabled? && LockCode.does_not_match?(code)) ? upon_failure(lock_screen) : upon_success(lock_screen)
      lock_screen.reset_screen
    end

    rmq(lock_screen).append(UIButton, :logout_button).on(:tap) do |sender|
      logout
    end
  end

  def lock_the_screen
    return if LockCode.disabled?

    if !@saved_view_controller
      @saved_view_controller = App.window.rootViewController
      App.window.rootViewController = self
    end
  end

  private

  def upon_failure lock_screen
    lock_screen.label.get.text = TRY_AGAIN_TEXT
    lock_screen.flash_background
    if @attempts > 5
      logout
      @attempts = 0
    else
      @attempts += 1
    end
  end

  def upon_success lock_screen
    @attempts = 0
    unlock_the_screen
    lock_screen.label.get.text = DEFAULT_TEXT
  end

  def unlock_the_screen
    if @saved_view_controller
      App.window.rootViewController = @saved_view_controller
      @saved_view_controller = nil
    end
  end

end
