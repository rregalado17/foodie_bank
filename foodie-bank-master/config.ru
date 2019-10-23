require './config/environment'

if ActiveRecord::Migrator.needs_migration?
    raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
  end
  
require_relative 'app/controllers/recipes_controller'
require_relative 'app/controllers/users_controller'

  use Rack::MethodOverride 
  use SessionsController
  use RecipesController
  use UsersController
  run ApplicationController