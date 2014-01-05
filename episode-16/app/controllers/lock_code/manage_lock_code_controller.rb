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

    @action = -> (confirmation_code) do
      stack = self.navigationController.viewControllers
      if input_code == confirmation_code
        outer_controller = stack.reverse.detect { |controller| controller.class != ManageLockCodeController }
        self.navigationController.popToViewController(outer_controller, animated: false)
      else
        App.alert("Your codes do not match.  Please try again.")
        controller = stack[stack.size - 2]
        self.navigationController.popToViewController(controller, animated: true)
      end
    end

    self
  end

  #def viewDidAppear(animated)
    #@lock_screen.reset_screen
  #end
 
  def viewDidLoad
    super
    rmq.stylesheet = ManageLockCodeStylesheet

    @lock_screen = rmq.append(LockScreen, :lock_screen).get
    @lock_screen.text = @text
    @lock_screen.style_for_controller(self)
    @lock_screen.action_on_last_button = @action
  end

end

