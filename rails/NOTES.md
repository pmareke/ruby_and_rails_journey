# Rails notes


<details><summary>Models</summary>
 
  ## [How to not get into trouble with Active Record](https://blog.rubyhero.dev/good-practices-with-active-record)
 
  ## [Active Record Basics](https://guides.rubyonrails.org/active_record_basics.html)

  - Active Record is the `M` in `MVC` which is the layer of the system responsible for representing business data and logic.
  - `ORM` is a technique that connects the rich objects of an application to tables in a relational database management system.
  - `Convention over Configuration`. If you follow the conventions adopted by Rails, you'll need to write very little configuration when creating Active Record models.
  - Rails will pluralize your class names to find the respective database table (`Book to books`).
  - When using class names composed of two or more words, the model class name should follow the CamelCase form.
  - By default, Active Record will use an integer column named id as the table's primary key.
  - The Foreign keys should be named following the pattern `singularized_table_name_id`.
  - There are some optional column names that will add additional features to Active Record instances, like `created_at` or `updated_at`.
  - To create Active Record models, subclass the `ApplicationRecord`.
  - `ApplicationRecord` inherits from `ActiveRecord::Base`.
    - You can use the `ActiveRecord::Base.table_name=` method to specify the table name that should be used.
    - To override the column that should be used as the table's primary key using the `ActiveRecord::Base.primary_key=`.
  - Active Record automatically creates methods to allow an application to read and manipulate data stored within its tables.
    - The `new` method will return a new object while `create` will return the object and save it to the database.
    - A call to `.save` will commit the record to the database.
    - Active Record provides a rich API for accessing data within a database like `all`, `first`, `last`, `where`, `order` or `find_by`.
    - The `update` method will update an existing object.
    - An Active Record object can be destroyed which removes it from the database with `.destroy`.
  - Active Record allows you to validate the state of a model before it gets written into the database.
  - Methods like `save` and `update` return false when validation fails and they don't actually perform any operations on the database.
  - `save!` and `update!` raise the exception `ActiveRecord::RecordInvalid` if validation fails.
  - The `validates :prop, presence: true` allow us to be more restricted about our properties.

  ## [Active Record Migrations](https://guides.rubyonrails.org/active_record_migrations.html)

  - Active Record will also update your `db/schema.rb` file to match the up-to-date structure of your database.
  - A primary key column called `id` will also be added implicitly, as it's the default primary key for all Active Record models.
  - The timestamps macro adds two columns, `created_at` and `updated_at`.
  - Migrations are stored as files in the `db/migrate` directory.
  - Active Record provides a generators to migrate our tables:
    - Alter tables `rails generate migration AddColumnToTable/RemoveColumnFromTable column_name:type`.
    - Create tables `rails generate migration CreateTable column_name:type`
    - Add references `rails generate migration AddClassToTable class:references`.
  - Active Record support the following column types: `binary, boolean, date, datetime, decimal, 
    float, integer, primary_key, string, text, time, timestamp`.
  - Active Record provides a generators to migrate create our models:
    - The model, resource, and scaffold generators will create migrations appropriate for adding a new model.
    - `rails generate model Product name:string description:text`.
  - You can run a migration with `rails db:migrate`.
  - You can run a rollback with `rails db:rollback`.
  - You can create the database a feed it with data using `rails db:setup`.
  - You can reset the database with `rails db:reset`.
  - The Active Record way claims that intelligence belongs in your models, not in the database.
    - Validations such as `validates :foreign_key, uniqueness: true` are one way in which models can enforce data integrity. 
    - The `:dependent` option on associations allows models to automatically destroy child objects when the parent is destroyed. 

  ## [Active Record Validations](https://guides.rubyonrails.org/active_record_validations.html)

  - A validation lets us know define if our classes are not valid without a given attribute.
  - Validations are used to ensure that only valid data is saved into your database.
  - There are two kinds of Active Record objects: those that correspond to a row inside your database and those that do not.
  - Active Record uses the `new_record?` instance method to determine whether an object is already in the database or not.
  - The bang versions, like `save!`, raise an exception if the record is invalid.
  - Before saving an Active Record object, Rails runs your validations.
  - `valid?` triggers your validations and returns true if no errors were found in the object, and false otherwise.
  - Any errors found can be accessed through the `.errors` instance method.
  - Active Record offers many pre-defined validation helpers:
    - `acceptance`: This method validates that a checkbox on the user interface was checked when a form was submitted.
    - `confirmation`: This method validates that two text fields should have exactly the same content.
    - `exclusion`: This method validates that the attributes' values are not included in a given set.
    - `length`: This method validates that the length of the attributes' values.
    - `presence`: This method validates that the specified attributes are not empty.
  - These are common validation options:
    - `message`: This method specify the message that will be added to the errors collection when validation fails.
    - `on`: This method specify when the validation should happen, default on `:create` but `:update` is available.

  ## [Active Record Callbacks](https://guides.rubyonrails.org/active_record_callbacks.html)

  - Active Record provides hooks into this object life cycle so that you can control your application and its data.
  - Callbacks are methods that get called at certain moments of an object's life cycle.
  - The main callbacks are:
    - `before_validation`.
    - `before_create`.
    - `before_save`.
    - `after_commit`.
    - `after_validation`.
    - `after_create`.
    - `after_save`.
    - `after_commit`.
  - The callback accept the `:on` helper to specify the action.
  - The callback could have conditional with the `if`or `unless` helpers.
  - There are also association callbacks:
    - `before_add`
    - `after_add`
    - `before_remove`
    - `after_remove`

  ## [Active Record Associations](https://guides.rubyonrails.org/association_basics.html)

  - An association is a connection between two Active Record models.
  - The six type of associations are:
    - `belongs_to`: 
      - Sets up a connection with another model, such that each instance of the declaring model "belongs to" one instance of the other model.
      - Must use the singular term.
      - It produces a one-directional one-to-one connection.
      - To setup a bi-directional association use it in combination with a `has_one` or `has_many` on the other model.
      - Says that this model's table contains a column which represents a reference to another table.
    - `has_one`: Indicates that one other model has a reference to this model. 
    - `has_many`: 
      - Association similar to `has_one`, but indicates a one-to-many connection with another model.
      - You'll often find this association on the "other side" of a belongs_to association.
      - Says that the other class contains the foreign key.
    - `has_many :through`:
      - Association is often used to set up a many-to-many connection with another model.
      - This association can be matched with zero or more instances of another model by proceeding through a third model.
      - Says that the other class will have a foreign key that refers to instances of this class.
    - `has_one :through`:
      - Association sets up a one-to-one connection with another model.
      - This association can be matched with one instance of another model by proceeding through a third model.
    - `has_and_belongs_to_many`:
      - Association creates a direct many-to-many connection with another model, with no intervening model.
      - You should set up a `has_many :through` relationship if you need to work with the relationship model as an independent entity.
      - If you don't need to do anything with the relationship model, it may be simpler to set up a `has_and_belongs_to_many` relationship.
      - This associates two classes via an intermediate join table that includes foreign keys referring to each of the classes.
  - In designing a data model, you will sometimes find a model that should have a relation to itself.
    -  This situation can be modeled with self-joining associations using `class_name`.

  ## [Active Record Query Interface](https://guides.rubyonrails.org/active_record_querying.html)

  - Active Record will perform queries on the database for you and is compatible with most database systems.
  - Active Record provides several finder methods:
    - Retrieving a Single Object: `find`, `take`, `first`, `last`, `find_by`.
    - Retrieving Multiple Objects in Batches: `find_each`, `find_in_batches`.
    - Conditions: `where`, `where.not`, `where().or(where())`, `where().and(where())`.
    - Ordering: `order`, `order(created_at: :asc/desc)`.
    - Selecting specific fields: `select`.
    - Limit and Offset: `limit`, `offset`.
    - Groups: `group`.
    - Total grouped items: `count`.
  - Eager loading is the mechanism for loading the associated records of the objects returned by `.find` using as few queries as possible.
    - With `.includes`, Active Record ensures that all of the specified associations are loaded using the minimum possible number of queries.
  - We can define scopes which are commonly-used queries which can be referenced as method calls on the association objects or models.
  - The `find_or_create_by` method checks whether a record with the specified attributes exists. If it doesn't, then `.create` is called.
  - The `find_or_initialize_by` method will work just like `find_or_create_by` but it will call `.new` instead of `.create`.
  - The `exists?` checks for the existence of the object in the database.
  - The `average` calculates the average of a comlumn from the database.
  - The `minimum` calculates the minimum of a comlumn from the database.
  - The `maximum` calculates the maximum of a comlumn from the database.
  - The `sum` calculates the sum of a comlumn from the database.
  - In order to understand the query behind the Active Record query you can use `.explain`.

</details>

<details><summary>Views</summary>
 
 ## [Layouts and Rendering in Rails](https://guides.rubyonrails.org/layouts_and_rendering.html)
 
 - From the controller's point of view, there are three ways to create an HTTP response:
   - Call `render` to create a full response to send back to the browser.
   - Call `redirect_to` to send an HTTP redirect status code to the browser.
   - Call `head` to create a response consisting solely of HTTP headers to send back to the browser.
 
 ### render
 - By default, controllers in Rails automatically render views with names that correspond to valid routes.
 - If we do not explicitly render something at the end of a controller action, Rails will automatically look for the `action_name.html.erb` template in the controller's view path and render it.
 - To render the view that corresponds to a different template within the same controller, you can use `render` with the name of the view.
 - `render` accepts the full path (relative to `app/views`) of the template to render.
 - The `render` method can do without a view completely using the :inline option to supply ERB as part of the method call.
 - We can send plain text back to the browser by using the `:plain` option to render.
 - We can send html back to the browser by using the `:html` option to render.
 - We can send JSON back to the browser by using the `:json` option to render.
 - We can send XML back to the browser by using the `:xml` option to render.
 - We can set the status code (`status_code: 500`) or the content type (`content_type: "application/json"`) calling the render.
 
 ### redirect_to
 
 - It tells the browser to send a new request for a different URL.
 - We can use `redirect_back` to return the user to the page they just came from.
 - We can use the `:status` option in order to change the HTTP code of the response.
 
 ### Layouts
 
 - We have access to three tools for combining different bits of output:
  - Asset tags are helpers provide methods for generating HTML that link views 
    to feeds, JavaScript, stylesheets, images, videos, and audios.
  - `yield` identifies a section where content from the view should be inserted.
  - `content_for` method allows you to insert content into a named yield block in your layout.
  - Partials  are another device for breaking the rendering process into more
    manageable chunks.
    - They're named with a leading underscore to distinguish them from regular
      views.
    - To render a partial as part of a view we can use the `render` method.
    - To pass local variables to the partial with the `locals:` helper.
    - When you pass a collection to a partial via the `:collection` option, 
      the partial will be inserted once for each member in the collection.

 ## [Action View Form Helpers](https://guides.rubyonrails.org/form_helpers.html)

 ### Forms
 
</details>

<details><summary>Controllers</summary>
 
 ## [Action Controller Overview](https://guides.rubyonrails.org/action_controller_overview.html)

 - Action Controller is the C in MVC.
 - A controller can thus be thought of as a middleman between models and views.
 - The naming convention of controllers in Rails favors pluralization of the
   last word in the controller's name.
 - A controller is a Ruby class which inherits from ApplicationController and has methods just like any other class.
 - A request to `/clients/new` will go to the `CliensController#new` and will
   render the `clients/new.html.erb` view.
 - Rails does not make any distinction between query string parameters and POST 
   parameters, and both are available in the `params` hash in your controller
 - With strong parameters, Action Controller parameters are forbidden to be used 
   in Active Model mass assignments until they have been permitted. 
 - `permit` searchs the specified key for inclusion otherwise, the key is going to be filtered out.
 - `require` ensures that a specific parameter or list of parameters are present.
 - Filters are methods that are run "before", "after" or "around" a controller action.

 ## [Rails Routing from the Outside In](https://guides.rubyonrails.org/routing.html)

 - The Rails router recognizes URLs and dispatches them to a controller's
   action.
 - The routes of the application live in the file `config/routes.rb`.
 - A single call to `resources` declares the routes for the `index`, `show`, 
   `new`, `edit`, `create`, `update`, and `destroy` actions.
 - By default, Rails creates routes for the seven default actions but the `:only` and 
   `:except` options allow us to fine-tune which actions we want to use.
 - Creating a resourceful route will also expose a number of helpers to the controllers:
   - `X_path returns`` /X.
   - `new_X_path` returns /X/new.
   - `edit_X_path(:id)` returns /X/:id/edit.
   - `X_path(:id)` returns /X/:id
 - `get 'profile', to: 'users#show'` creates the `/profile` path pointing
   to the `UsersController` and `show` action.
 - It's possible to create `scopes`s in order to add prefixs in the url.
 - Nested routes allows to capture the relationships in the routes.
 - Rails can create paths and URLs from an array of parameters with the helper
   `X_Y_path(@x, @y)` or `url_for([@x, @y])`.
 - It's possible to specify a name for any route using the `:as` option.
 - It's possible to redirect any path to another path by using the `redirect` helper in the router.
 - It's possible to specify what Rails should route `/` to with the `root` method.
 - Rails offers a way to break the `routes.rb` file into multiple small ones using the `draw` macro.
 - To get a complete list of the available routes the application, visit
   `http://localhost:3000/rails/info/routes`.

</details>

<details><summary>Testing</summary>
 
 ## [Testing](https://guides.rubyonrails.org/testing.html)

 ### Types of testing in Rails

 - Model specs: Are for testing models.
 - System specs: Are E2E tests, using the browser.
 - Request specs: Are tests for controller actions in isolation.
 - Helper specs.
 - Mailer specs.
 - Job specs.
 
 ### [RSpec/Capybara tests](https://www.codewithjason.com/rails-integration-tests-rspec-capybara/)

 ```ruby
require 'rails_helper'

RSpec.describe 'Creating a city', type: :feature do
  scenario 'valid inputs' do
    visit new_city_path
    fill_in 'Name', with: 'Minneapolis'
    click_on 'Create City'
    visit cities_path

    expect(page).to have_content('Minneapolis')
  end

  scenario 'invalid inputs' do
    visit new_city_path
    fill_in 'Name', with: ''
    click_on 'Create City'

    expect(page).to have_content("Name can't be blank")
  end
end

RSpec.describe 'Deleting a city', type: :feature do
  scenario 'success' do
    City.create!(name: 'NYC')
    visit cities_path

    expect(page).to have_content('NYC')

    click_on 'Destroy'
    accept_alert

    expect(page).not_to have_content('NYC')
  end
end
 ```
 
</details>

<details><summary>Other Components</summary>
 
 ## [Support Core Extensions](https://guides.rubyonrails.org/active_support_core_extensions.html)

 - It's the component responsible for providing Ruby language extensions and utilities.
 - A Ruby on Rails application loads all Active Support unless `config.active_support.bare` is `true`.
 - The main extensions are:
   - `blank?`.
   - `present?`.
   - `try`.
   - `to_param`.
   - `to_query`.
   - `in?`.
   - `squish`.
   - `truncate` or `truncate_words`.
   - `pluralize` or `singularize.
   - `dasherize` or `underscore`.
   - `to_date` or `to_time` or `to_datetime`.
   - `1.seconds` or `2.minutes` or `3.days`.
   - `many?`.
 
 ## [Mailer](https://guides.rubyonrails.org/action_mailer_basics.html)

 - Action Mailer allows send emails from your application using mailer classes and views.
 - We can create a Mailer with `rails generate mailer XXX`.
 - The mail views live in the `app/views/XXX_mailer/`.
 - The mail actions which send the email live in the `app/mailers/XXX_mailer.rb`
 - The name of the action should be the same as the view.
 - The email can be sent immediately with `deliver_now` or async `deliver_later`.
 - It's possible to preview an email creating a `test/mailers/previews/XXX_mailer_preview.rb`:
   - The preview is available at `http://localhost:3000/rails/mailers/XXX_mailer/ACTION`.
 - Example of how configure a [Gmail account](https://guides.rubyonrails.org/action_mailer_basics.html#action-mailer-configuration-for-gmail).
 
 ## [Jobs](https://guides.rubyonrails.org/active_job_basics.html)

 - These jobs can be everything from regularly scheduled clean-ups, to billing 
   charges, to mailings.
 - We can create a Job with `rails generate job XXX`.
 - The jobs live in the `app/jobs/`.
 - A job is a Ruby class with a `perform` or `perform_later` method.
 - For enqueuing and executing jobs in production you need to set up a queuing 
   backend, that is to say, you need to decide on a 3rd-party queuing 
   library that Rails should use.
 - To setting the queuing backend use `config.active_job.queue_adapter`.
   - Few examples [here](https://guides.rubyonrails.org/active_job_basics.html#starting-the-backend).
 - With Active Job you can schedule the job to run on a specific queue using `queue_as`.
 - You can prefix the queue name for all your jobs using `config.active_job.queue_name_prefix` in `application.rb`.
 - Active Job provides hooks to trigger logic during the life cycle of a job.
 - One of the most common jobs in a modern web application is sending emails outside of the request-response cycle.
 - Exceptions raised during the execution of the job can be handled with `rescue_from`.
 - It's possible to retry or discard a failed job by using `retry_on` or `discard_on`, respectively.
 - Jobs can be tested in isolation and in context.
 - The default queue adapter for tests will not perform jobs until `perform_enqueued_jobs` is called.

 ## [Configuring](https://guides.rubyonrails.org/configuring.html)

 - Rails offers four standard spots to place initialization code:
   - `config/application.rb`.
   - Environment-specific configuration files.
   - Initializers.
   - After-initializers.
 - The configuration file `config/application.rb` and environment-specific 
 configuration files (such as `config/environments/production.rb`) allow 
 you to specify the various settings that you want to pass down to all of the components.

 ## [Command Line](https://guides.rubyonrails.org/command_line.html)

 - All the commands are available under the `rails` keyword.
   - `rails --help` to get the list of rails commands.
   - `rails new` to create a new rails app.
   - `rails console` to open a Rails console (it uses IRB under the hood).
   - `rails server` to start the Rails server
   - `rails test` to run the tests.
   - `rails generate` to generate different artifacts (models, controllers, views, ...).
   - `rails db:migrate` to apply the latest migration to the database.
   - `rails db:create` to create the database.
   - `rails routes` to get the list of routes in the app.
   - `rails dbconsole` to open a shell inside the database (it only supports MySQL, Postgres and SQLite).
   - `rails notes` to get the list of TODOs and FIXMEs in the code.

</details>
