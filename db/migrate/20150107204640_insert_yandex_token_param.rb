class InsertYandexTokenParam < ActiveRecord::Migration
  def up
    SystemParam.create!(name:'Yandex Access Token', code:'yandex_access_token')
  end

  def down

  end
end
