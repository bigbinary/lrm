class LoginController < UIViewController

  def viewDidLoad
    super

    rmq.append(UIView, :login_form).tap do |q| 
      email = q.append(UITextField, :email).get
      pwd = q.append(UITextField, :password).get
          
      rmq(email).style do |st|
        st.frame = {l: 100, t: 80, w: 100, h: 30} 
        st.background_color = rmq.color.white
      end 
      rmq(pwd).style do |st|
        st.frame = {l: 100, t: 120, w: 100, h: 30} 
        st.background_color = rmq.color.white
      end 
    end 
    rmq(:login_form).style do |st|
      st.frame = {l: 20, t: 30, w:200, h: 250}
      st.background_color = rmq.color.white
    end


  end

end
