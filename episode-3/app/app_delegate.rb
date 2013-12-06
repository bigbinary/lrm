class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = klass.alloc.init
    @window.makeKeyAndVisible
    true
  end

  # Usage
  #
  # rake PART=1
  def klass
    part = ENV['PART']
    if part.nil?
      puts "using default part"
    else
      puts "using part #{part}"
    end

    case part
    when '1'
      Loginv1Controller
    when '2'
      Loginv2Controller
    when '3'
      Loginv3Controller
    else
      Loginv2Controller
    end
  end

end
