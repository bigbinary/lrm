class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = klass.alloc.init
    @window.makeKeyAndVisible
    true
  end

  # Usage
  #
  # VERSION=1 rake 
  def klass
    case ENV['VERSION'].to_i
    when 1
      Loginv1Controller
    when 2
      Loginv2Controller
    when 3
      Loginv3Controller
    else
      Loginv3Controller
    end
  end

end
