view_creation_script
====================

According to [this post on StackOverflow](http://stackoverflow.com/questions/11666736/rails-3-2-6-database-views-creation-through-migrations), these views can be added to the mgrations as

This first approach is implemented here: https://github.com/PecanProject/bety/pull/11

At first glance, these appear compatable with Postgres and MySQL. I will test this out on Thursday.

```{ruby}
class CreateMyView < ActiveRecord::Migration
  def self.up
    execute <<-SQL
      CREATE VIEW my_view AS SELECT ...
    SQL
  end
  def self.down
    execute <<-SQL
      DROP VIEW my_view
    SQL
  end
end
```

A more advanced (or ruby-based) option is [rails_sql_views gem](http://activewarehouse.rubyforge.org/rails_sql_views/). It is (apparently) compatable with MySQL and PostgreSQL. The code goes something like:

```{ruby}
  class CreatePersonView < ActiveRecord::Migration
    def self.up
      create_view :v_people, "select * from people" do |t|
        t.column :id
        t.column :name
        t.column :social_security
      end
    end

    def self.down
      drop_view :v_people
    end
  end
````

A more recent versions on [github]((https://github.com/ryanlitalien/rails_sql_views)) has support for rails > 3.1. There are also newer versions on [rubygems.org](http://rubygems.org/search?utf8=%E2%9C%93&query=sql+views)
