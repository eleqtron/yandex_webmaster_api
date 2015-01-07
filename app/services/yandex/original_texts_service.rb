class Yandex::OriginalTextsService

  APP_HOST        = Settings.yandex.app_host
  YANDEX_TOKEN    = SystemParam.find_by(code:'yandex_access_token').try(:value)

  attr_reader :text, :response

  def initialize(text)
    @text = text
  end

  #функция добавления текста в сервис Оригинальные тексты
  def send_text
    log('YANDEX_TOKEN is empty') and return false if YANDEX_TOKEN.blank?
    @response = send_request
    log_result_of_sending_text
    @response.code == '201' || @response.code == '409'
  end

  private

  #запрос на добавление текста в сервис Оригинальные тексты
  def send_request
    uri = URI.parse("http://webmaster.yandex.ru/api/v2/hosts/#{APP_HOST}/original-texts")
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri)
    request.add_field('Host', 'webmaster.yandex.ru')
    request.add_field('Authorization', "OAuth #{YANDEX_TOKEN}")
    content = request_body
    request.add_field('Content-Length', content.size)
    request.body = content
    http.request(request)
  end

  #формируем XML
  def request_body
    builder = Nokogiri::XML::Builder.new(encoding:'UTF-8') do |xml|
      xml.send(:'original-text') do
        xml.content( Rack::Utils.escape(@text) )
      end
    end
    builder.doc.root.to_s
  end

  def log_result_of_sending_text
    log("\r\n"*3)
    log(['='*3,'YANDEX ORIGINAL TEXTS', '='*50].join(' '))
    log(@text)
    log('Sent to Yandex result:')
    log("request.code: #{@response.code}")
    log("request.body: #{@response.body}")
    log("\r\n"*3)
  end

  def log(message)
    Rails.logger.info(message)
  end

end