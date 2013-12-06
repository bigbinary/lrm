class Loginv1Controller < UIViewController

  def viewDidLoad
    super

    rmq.append(UIView, :login_form).tap do |q| 
      q.append(UITextField, :email).get
      q.append(UITextField, :password).get
    end 

  end

end
