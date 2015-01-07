class Yandex::AuthorizationService

  CLIENT_ID       = Settings.yandex.client_id
  CLIENT_PASSWORD = Settings.yandex.client_password

  #запрос на получение токена по коду
  def authorization_code_request(code)
    uri = URI.parse('https://oauth.yandex.ru/token')
    http = Net::HTTP.new(uri.host, uri.port)
    if uri.scheme == 'https'
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    end
    request = Net::HTTP::Post.new(uri.request_uri)
    request.set_form_data(grant_type: 'authorization_code', code:code, client_id: CLIENT_ID, client_secret: CLIENT_PASSWORD)
    request.add_field('Content-Type', 'application/x-www-form-urlencoded')
    http.request(request)
  end

end