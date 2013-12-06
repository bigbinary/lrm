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
      part = '3'
    else
      puts "using part #{part}"
    end

    case part
    when '1'
      Loginv1Controller
    when '2'
      Loginv2Controller
    when '3'
      StandardAppearance.set_named_fonts_and_colors

      Loginv3Controller
    end
  end

end
