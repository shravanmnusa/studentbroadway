Rails.application.routes.draw do
  
	root 'first_pages#home'
	get 'faq' => 'first_pages#faq'
	get 'signup'=> 'sb_users#new'
	resources :sb_users
end
