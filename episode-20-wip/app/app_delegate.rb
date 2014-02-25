class AppDelegate

  attr_reader :language_service

  LOCK_TIME = 5 * 60

  def application(application, didFinishLaunchingWithOptions:launchOptions)

    StandardAppearance.apply

    @window = IdlingWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    setup_lock_screen

    @window.rootViewController = build_tabbar

    @language_service = LanguagesService.new

    @window.makeKeyAndVisible
    true
  end

  def applicationWillEnterForeground app
    @screen_lock_controller.lock_the_screen
  end

  private

  def setup_lock_screen
    @screen_lock_controller = ScreenLockController.alloc.initWithText("Enter code to unlock")

    App.notification_center.observe(IdlingWindow::BECAME_IDLE, @window) do |_|
      @screen_lock_controller.lock_the_screen
    end

    @window.set_idle_timeout_seconds LOCK_TIME
  end

  def build_tabbar
    tabbar = UITabBarController.alloc.init
    tabbar.viewControllers = [
      UINavigationController.alloc.initWithRootViewController(StaticLanguagesController.alloc.init),
      UINavigationController.alloc.initWithRootViewController(DynamicLanguagesController.alloc.init),
      UINavigationController.alloc.initWithRootViewController(AllLanguagesController.alloc.init),
      UINavigationController.alloc.initWithRootViewController(MoreActionsController.alloc.init)
    ]
    tabbar.selectedIndex = 0
    tabbar.delegate = self
    tabbar
  end


end
