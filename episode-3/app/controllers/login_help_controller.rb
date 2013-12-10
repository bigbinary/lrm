class LoginHelpController < UIViewController

  def viewDidLoad
    super

    rmq.stylesheet = LoginHelpControllerStylesheet
    rmq(self.view).apply_style :root_view

    rmq.append(UIView, :form).tap do |q|

      q.append(UILabel, :help_title_label)
      q.append(UILabel, :help_note_label)

      q.append(UITextField, :email).get

      q.append(UIButton, :send_button).on(:tap) do |sender| 
        reset_password
      end
    end
  end

end
