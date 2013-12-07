class Loginv4Controller < UIViewController

  def viewDidLoad
    super

    rmq.stylesheet = Loginv3ControllerStylesheet
    rmq(self.view).apply_style :root_view

    rmq.append(UIView, :login_form).tap do |q| 
      @email = q.append(UITextField, :email).get
      @password = q.append(UITextField, :password).get

      q.append(UIButton, :login_button).on(:tap) do |_|
        login
      end
    end 
  end

  def login
    if submission_invalid?
      handle_invalid_submission
    else
      handle_valid_submission
    end
  end

  def submission_invalid?
    @email.text.blank? || @password.text.blank?
  end


end
