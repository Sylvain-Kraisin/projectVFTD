Rails.application.routes.draw do

  mount RedactorRails::Engine => '/redactor_rails'
  devise_for :users, controllers: {registrations: 'registrations'}

  root 'pages#index'

  get 'pages/videos' => 'pages#videos'
  get 'pages/blog' => 'posts#index'
  get 'pages/casier' => 'pages#casier'
  get 'pages/halloffame' => 'pages#halloffame'
  get 'pages/faq' => 'pages#faq'
  get 'pages/cooperative' => 'pages#cooperative'
  get 'pages/cartable_numerique' => 'pages#cartable_numerique'
  get 'pages/adminpage' => 'pages#adminpage'
  get 'pages/correspondances' => 'pages#correspondances'

  get 'discourse/sso' => 'discourse_sso#sso'


  resources :consoles
  get 'consoles/draft/:id', to: 'consoles#draft', as: 'draft_videos_show'

  resources :videos
  post 'videos/publish' => 'videos#publish'

  resources :tests do
    resources :reponses
  end

  resources :posts do
    resources :comments
  end
  post 'posts/submit_accept_or_refuse' => 'posts#submit_accept_or_refuse'

end
