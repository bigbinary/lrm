class AppDelegate

  attr_reader :language_service

  def application(application, didFinishLaunchingWithOptions:launchOptions)

    StandardAppearance.apply

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = build_tabbar

    @language_service = LanguagesService.new

    @window.makeKeyAndVisible
    true
  end

  private

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
