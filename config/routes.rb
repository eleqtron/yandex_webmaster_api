Rails.application.routes.draw do

  root 'articles#index'
  resources :articles do
    post :send_to_yandex, on: :member
  end
  get 'yandex/token', to: 'yandex#token'

end
