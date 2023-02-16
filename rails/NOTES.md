# Rails notes


<details><summary>Models</summary>
 
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
    - Alter tables `rails generate migration AddColumnToTable/RemoveColumnFromTable`.
    - Create tables `rails generate migration CreateTable`
    - Add references `rails generate migration AddClassToTable class:references`.
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

  ## [Action View Form Helpers](https://guides.rubyonrails.org/form_helpers.html)
</details>
