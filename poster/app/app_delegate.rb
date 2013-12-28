class AppDelegate
  attr_reader :window
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    StandardAppearance.set_named_fonts_and_colors
    @window.rootViewController = LoginController.alloc.init
    @window.makeKeyAndVisible
    true
  end
end
