class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    App::Persistence['authToken'] = nil
    
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = LoginController.alloc.init
    @window.makeKeyAndVisible
    true
  end

end
