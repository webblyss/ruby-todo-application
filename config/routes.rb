Rails.application.routes.draw do
 root 'home#index'
 post '/process_input', to: 'home#process_input'
 delete '/todos/:id', to: 'home#destroy', as: 'todo'
 patch '/todos/:id', to: 'home#update', as: 'update_todo'

end
