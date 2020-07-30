Rails.application.routes.draw do
  root 'boards#index'
  # get '/', to: "pages#index"
  #* 也可以這樣寫，但 root 寫法比較常見

  get '/about', to: 'pages#about'

  resources :boards do
  #* resources :boards, path: 'cards' 自動轉址
    # resources :posts, only: [:index, :new, :create]

    resources :posts, shallow: true
    #* 直接做掉分兩次的 only 和 except 寫法
  end

  # resources :posts, except: [:index, :new, :create]
end
