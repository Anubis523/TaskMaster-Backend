Rails.application.routes.draw do
  resources :workers

  get '/workers/:id/tasks' => 'workers#show_tasks'
  get 'workers/:id/employer' => 'workers#my_boss'
  get '/workers/:id/project' => 'workers#my_project'
  get '/workers/:id/info' => 'workers#get_worker_info'

  get '/employers/:id/projects/:project_id/tasks' => 'employers#show_tasks'
  get '/employers/:id/projects/:project_id' => 'employers#show_project'
  get '/employers/:id/projects' => 'employers#my_projects'
  get '/employers/:id/workers' => 'employers#my_workers'
  get '/employers/:id' => 'employers#show_employer'

  post '/employers/:id/projects/:project_id/create-task' => 'employers#add_task'
  post '/employers/:id/create-worker' => 'employers#new_worker'
  post '/employers/:id/create-project' => 'employers#new_project'
  post '/employers/new' => 'employers#create_employer'
  post '/employers/login' => 'employers#login'

  patch '/employers/:id/projects/:project_id/tasks/:task_id' => 'employers#edit_task'
  patch '/employers/:id/projects/:project_id' => 'employers#edit_project'

  patch '/workers/:id/tasks/:task_id' => 'workers#edit_task'
  patch '/workers/:id/update' => 'workers#update_info'

  # delete works just highlights differently for no reason
  delete '/employers/:id/projects/:project_id' => 'employers#delete_project'
  delete '/employers/:id/workers/:worker_id' => 'employers#remove_worker'

  delete '/workers/:id/tasks/:task_id' => 'workers#remove_task'
  delete '/task/:id' => 'employers#delete_task'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
