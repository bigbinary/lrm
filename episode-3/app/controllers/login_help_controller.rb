class LoginHelpController < UIViewController

  def viewDidLoad
    super

    rmq.stylesheet = LoginHelpControllerStylesheet
    rmq(self.view).apply_style :root_view

    rmq.append(UIView, :form).tap do |q|

      q.append(UILabel, :help_title_label)
      q.append(UILabel, :help_note_label)

      @email = q.append(UITextField, :email).get

      q.append(UIButton, :send_button).on(:tap) do |sender| 
        reset_password
      end
    end
  end

  def reset_password
    if submission_invalid?
      handle_invalid_submission
    else
      handle_valid_submission
    end
  end

  def handle_valid_submission
    process_reset_password @email.text, App::Persistence['device_token']
  end

  def process_reset_password email, device_token
    PasswordResetService.new(self, {email: email, device_token: device_token}).process
  end

  def submission_invalid?
    @email.text.blank?
  end

  def handle_invalid_submission
    App.alert "Enter email address"
  end

  def handle_no_record_found
    App.alert "No record was found for #{@email.text}"
  end

  def handle_password_reset_successful
    message = 'You will receive an email with instructions about how to reset your password in a few minutes'
    App.alert message
    self.dismissViewControllerAnimated(true, completion: nil)
  end
                
  def handle_server_error
    App.alert('something went wrong')
  end

end
