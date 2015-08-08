Rails.application.routes.draw do
  
  devise_for :users
  root :to => "article_board#main_board"
  get ':controller(/:action(/:id))'
  post ':controller(/:action(/:id))'
  
end
