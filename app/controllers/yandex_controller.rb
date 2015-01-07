class YandexController < ApplicationController

  def token
    render_404 and return if params[:state] != Settings.yandex.state #проверям наш секрентый ключ, он должен совпадать
    yws  = Yandex::AuthorizationService.new
    result = yws.authorization_code_request(params[:code]) #отправляем POST-запрос с кодом для получения токена
    log(result.code)
    if result.code == '200'
      #если все ОК получаем параметры из JSON'a
      result_params = ActiveSupport::JSON.decode(result.body)
      log(result_params)
      #сохраняем полученный токен
      sp = SystemParam.find_by(code:'yandex_access_token')
      sp.value = result_params['access_token']
      sp.expires_at = Time.at(Time.now.to_i + result_params['expires_in'])
      sp.save!
    end
    redirect_to root_url
  end

  private

  def log message
    Rails.logger.info(message)
  end

  def render_404
    respond_to do |format|
      format.html { render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found }
      format.xml  { head :not_found }
      format.any  { head :not_found }
    end
  end

end