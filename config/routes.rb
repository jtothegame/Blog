Rails.application.routes.draw do
  # get('/about', { to: 'about#index' })

  resources :blog do
  end

  get('/about', { to: 'about#index' })

  get('/contact_us', { to: 'contact#new', as: 'contact' })
  post('/contact', { to: 'contact#create', as: 'contact_submit'})


  root 'home#index'
end
