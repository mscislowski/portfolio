Rails.application.routes.draw do
  get '/projects' => 'projects#index'
  get '/projects/revisions' => 'projects#revisions'
  get '/projects/commits' => 'projects#commits'
  root to: 'visitors#index'
end
