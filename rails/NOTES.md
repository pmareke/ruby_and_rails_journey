# Rails notes

## Models

### [Active Record Basics](https://guides.rubyonrails.org/active_record_basics.html)

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

### [Active Record Migrations](https://guides.rubyonrails.org/active_record_migrations.html)

### [Active Record Validations](https://guides.rubyonrails.org/active_record_validations.html)

### [Active Record Callbacks](https://guides.rubyonrails.org/active_record_callbacks.html)

### [Active Record Associations](https://guides.rubyonrails.org/association_basics.html)

### [Active Record Query Interface](https://guides.rubyonrails.org/active_record_querying.html)

### [Active Model Basics](https://guides.rubyonrails.org/active_model_basics.html)
