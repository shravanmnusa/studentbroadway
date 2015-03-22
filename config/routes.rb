Rails.application.routes.draw do
  
  root 'first_pages#home'
  get 'faq' => 'first_pages#faq'

end
