# [Migrations](https://guides.rubyonrails.org/v3.2/migrations.html)

- Migrations are a convenient way for you to alter your database in a structured and organized manner.
- Active Record tracks which migrations have already been run so all you have to do is update your source and run rake `db:migrate`.

## Anatomy of a Migration

```ruby
class CreateProducts < ActiveRecord::Migration
  def up
    create_table :products do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def down
    drop_table :products
  end
end
```

- Makes migrations smarter by providing a new `change` method.
	- This method is preferred for writing constructive migrations (adding columns or tables).

```ruby
class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
 
      t.timestamps
    end
  end
end
```

##  Migrations are Classes

- A migration is a subclass of ActiveRecord::Migration that implements two methods:
	- `up` (perform the required transformations).
	- `down` (revert them).
- Active Record provides methods that perform common data definition tasks in a database independent way (you’ll read about them in detail later):
	- add_column.
	- add_index.
	- change_column.
	- change_table.
	- create_table.
	- drop_table.
	- remove_column.
	- remove_index.
	- rename_column.

## Supported Types

- Active Record supports the following database column types:
	- binary.
	- boolean.
	- date.
	- datetime.
	- decimal.
	- float.
	- integer.
	- primary_key.
	- string.
	- text.
	- time.
	- timestamp.

## Creating a Migration

- The model and scaffold generators will create migrations appropriate for adding a new model.
	- `rails generate model Product name:string description:text`.

### Creating a Standalone Migration

- If you want to add a column to an existing table, you can also use the migration generator.
	- `$ rails generate migration AddPartNumberToProducts part_number:string`.
	- `$ rails generate migration AddDetailsToProducts part_number:string price:decimal`.

## Running Migrations

- Rails provides a set of rake tasks to work with migrations which boil down to running certain sets of migrations.
	- `rake db:migrate`.
	- `rake db:migrate VERSION=20080906120000`.

## Rolling Back

- `rake db:rollback`.
- `rake db:rollback STEP=N`.

## Resetting the database

- `rake db:reset`.

