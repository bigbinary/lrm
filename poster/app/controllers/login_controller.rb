class LoginController < UIViewController

  def viewDidLoad
    super

    rmq.stylesheet = LoginControllerStylesheet
    rmq(self.view).apply_style :root_view

    rmq.append(UIView, :login_form).tap do |q| 
      @email = q.append(UITextField, :email).get
      @password = q.append(UITextField, :password).get

      q.append(UIButton, :login_button).on(:tap) do |_|
        login
      end

      q.append(UILabel, :help_label)
      q.append(UIButton, :help_button).on(:tap) do |_|
         controller = LoginHelpController.alloc.init
         controller.modalTransitionStyle = UIModalTransitionStylePartialCurl
         self.presentModalViewController(controller, animated: true)
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

  def handle_valid_submission
    process_authentication @email.text, App::Persistence['device_token'], @password.text
  end

  def process_authentication(email, device_token, password)
    AuthenticationService.new(self, {email: email, device_token: device_token, password: password}).process
  end

  def handle_login_failed response
    App.alert('Login failed!')
  end

  def handle_login_successful response
    json = response_in_json response
    App::Persistence['authToken'] = json["authToken"]
    App::Persistence['userEmail'] = @email.text
    App.alert('You have successfully logged in.')
    App.delegate.window.rootViewController= PostsController.alloc.init
  end

  def handle_server_error response
    App.alert('something went wrong')
  end

  def submission_invalid?
    @email.text.blank? || @password.text.blank?
  end

  def handle_invalid_submission
    if @email.text.blank?
      App.alert 'Please enter email'
    elsif @password.text.blank?
      App.alert 'Please enter password'
    end
  end

  def response_in_json response
    BW::JSON.parse(response.body.to_str)
  end

end
