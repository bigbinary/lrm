class Loginv1Controller < UIViewController

  def viewDidLoad
    super

    rmq.append(UIView, :login_form).tap do |q| 
      q.append(UITextField, :email)
      q.append(UITextField, :password)
    end 

  end

end
