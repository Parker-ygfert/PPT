Rails.application.routes.draw do
  root 'pages#index'
  # get '/', to: "pages#index"
  #* 也可以這樣寫，但 root 寫法比較常見

  get '/about', to: 'pages#about'

  resources :boards
  #* resources :boards, path: 'cards' 自動轉址
end
