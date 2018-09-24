Rails.application.routes.draw do

  root "static_pages#home"
  get "/help", to: "static_pages#help"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/course_1", to: "users#course_1"
  get "/course_2", to: "users#course_2"
  get "/wordlists", to: "wordlists#a-b"
  get "/c-d", to: "wordlists#c-d"
  get "/e-g", to: "wordlists#e-g"
  get "/h-k", to: "wordlists#h-k"
  get "/l-n", to: "wordlists#l-n"
  get "/o-p", to: "wordlists#o-p"
  get "/q-r", to: "wordlists#q-r"
  get "/s", to: "wordlists#s"
  get "/t", to: "wordlists#t"
  get "/u-z", to: "wordlists#u-z"
  get "/wordlist1s", to: "wordlist1s#index"
  get "/wordlist1s/new", to: "wordlist1s#new"
  get "/learneds", to: "learneds#update"

  resources :users
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :questions
  resources :lessons
  resources :lesson_qetions
  resources :relationships, only: [:create, :destroy]
  resources :wordlist1s
  resources :learneds

end
