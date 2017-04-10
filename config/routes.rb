Rails.application.routes.draw do
  # get('/about', { to: 'about#index' })

  resources :posts

  resources :users, only: [:new, :create]

  get('/home', { to: 'home#index'})
  get('/home/:id', { to: 'home#show', as: 'home_show' })

  get('/about', { to: 'about#index' })

  get('/contact', { to: 'contact#index', as: 'contact' })
  post('/contact', { to: 'contact#create', as: 'contact_submit'})

  root 'home#index'
end
