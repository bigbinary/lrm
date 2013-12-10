class AuthenticationService

  attr_reader :hash, :client

  API_LOGIN_END_POINT = 'http://lrm-authentication-production.herokuapp.com/v1/login'

  def initialize client, options
    @client = client

    email = options.fetch :email
    device_token = options.fetch :device_token
    password = options.fetch :password

    @hash = { user: { email: email, device_token: device_token, password: password } }
  end

  def process
    payload = BW::JSON.generate(hash)
    headers = { 'Content-Type' => 'application/json' }

    BW::HTTP.post(API_LOGIN_END_POINT, { headers: headers, payload: payload } ) do |response|
      handle_response response
    end
  end

  private

  def handle_response response
    puts response.body.to_s
    puts response.status_code.to_s

    method =  case response.status_code
              when 401
                :handle_login_failed
              when 200..299
                :handle_login_successful
              when 500..599
                :handle_server_error
              end
    client.send method
  end

end
