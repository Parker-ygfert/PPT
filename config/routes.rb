Rails.application.routes.draw do
  root 'pages#index'
  get '/about', to: "pages#about"

  
  #* 也可以這樣寫，但 root 寫法比較常見
  # get '/', to: "pages#index"
end
