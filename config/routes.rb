Rails.application.routes.draw do
  
  get 'sb_users/new'

  root 'first_pages#home'
  get 'faq' => 'first_pages#faq'

end
