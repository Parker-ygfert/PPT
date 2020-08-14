Rails.application.routes.draw do
  root 'pages#index'
  # get '/', to: "pages#index"
  #* 也可以這樣寫，但 root 寫法比較常見

  get '/about', to: 'pages#about'

  resources :favorites, only: [:index]

  resources :boards do
    #* resources :boards, path: 'cards' 自動轉址
    # resources :posts, only: [:index, :new, :create]

    resources :posts, shallow: true do
    #* 直接做掉分兩次的 only 和 except 寫法
      resources :comments, shallow: true, only: [:create]
      # post 
    end

    member do
      post :favorite
    end
  end

  # resources :posts, except: [:index, :new, :create]

  resource :users, only: [:create, :edit, :update] do
    collection do
      get :sign_up
      get :sign_in
      post :login
      delete :sign_out
    end
  end

  #! create 路徑顯示會跑到最下面
  # resources :users, only: [:create] do
    #* 擴充新路徑
    #* member 有 ID
    # member do
    #   get :profile
    # end

    #* collection 無 ID
    # collection do
    #   get :sign_up
      # get :edit
      # patch :update
    #   get :sign_in
    #   post :login
    #   delete :sign_out
    # end
  # end

  namespace :api do
    namespace :v2 do
      resources :boards, only: [:index]
    end
  end
  
end
