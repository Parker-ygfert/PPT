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

  resources :users, only: [:create] do
    #* 擴充新路徑
    #* member 有 ID
    # member do
    #   get :profile
    # end

    #* collection 無 ID
    collection do
      get :sign_up
      get :edit
      patch :update
      get :sign_in
      post :login
      delete :sing_out
    end
  end
end
