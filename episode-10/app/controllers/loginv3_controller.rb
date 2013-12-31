class Loginv3Controller < UIViewController

  def viewDidLoad
    super

    rmq.stylesheet = Loginv3ControllerStylesheet
    rmq(self.view).apply_style :root_view

    rmq.append(UIView, :login_form).tap do |q| 
      q.append(UITextField, :email)
      q.append(UITextField, :password)
      q.append(UIButton, :login_button)
    end 

  end
end
