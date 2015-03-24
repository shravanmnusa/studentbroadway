Rails.application.routes.draw do
  
	root   'first_pages#home'
	get	   'faq' => 'first_pages#faq'
	get    'signup'=> 'sb_users#new'
	get    'login'   => 'sessions#new'
	post   'login'   => 'sessions#create'
	delete 'logout'  => 'sessions#destroy'
	resources :sb_users
	resources :sbuser_activate, only: [:edit]

end
