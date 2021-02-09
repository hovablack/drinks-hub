require './config/environment'

raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.' if ActiveRecord::Base.connection.migration_context.needs_migration?

use Rack::MethodOverride

run ApplicationController
use DrinksController
use ClientsController
