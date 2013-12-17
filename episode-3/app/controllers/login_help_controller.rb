class LoginHelpController < UIViewController

  def viewDidLoad
    super
    @presented_by = self.presentingViewController
    rmq.stylesheet = LoginHelpControllerStylesheet
    rmq(self.view).apply_style :root_view

    rmq.append(UIView, :form).tap do |q|

      q.append(UILabel, :help_title_label)
      q.append(UILabel, :help_note_label)

      @email = q.append(UITextField, :email).get

      q.append(UIButton, :send_button).on(:tap) do |sender| 
        reset_password
      end

      q.append(UIButton, :go_back_to_login_button).on(:tap) do |_|
        self.dismissViewControllerAnimated(true, completion: nil)
      end

      q.append(UILabel, :more_help_title_label)
      q.append(UILabel, :more_help_note_label)
      q.append(UIButton, :more_help_button).on(:tap) do |_|
        self.dismissViewControllerAnimated(true, completion: -> { present_email_editor } )
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

  def present_email_editor
    if MFMailComposeViewController.canSendMail
      mail_controller = MFMailComposeViewController.alloc.init
      if mail_controller
        mail_controller.mailComposeDelegate = self;
        mail_controller.setToRecipients ['support@BigBinary.com']
        mail_controller.setSubject "Learn RubyMotion - login help"
        @presented_by.presentViewController mail_controller, animated: true, completion: nil
      end
    else
      App.alert 'Your device is not configured to send email'
    end
  end


  def mailComposeController(controller, didFinishWithResult: result, error: error)
    @presented_by.dismissViewControllerAnimated true, completion: -> do
      if result == MFMailComposeResultSent
        App.alert 'Thank you for your email, we will get back to you as soon as possible.' 
      end
    end
  end

end
