Rails.application.routes.draw do
	root 'pages#portal'
	get :portal, :home, :product, :exhibition, :about, :contact, controller: :pages
	resources :products

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
