class LoginController < UIViewController

  def viewDidLoad
    super

    rmq.append(UIView, :form).tap do |q|
      @email = q.append(UITextField, :email).get
      @password = q.append(UITextField, :password).get
    end

  end

end
