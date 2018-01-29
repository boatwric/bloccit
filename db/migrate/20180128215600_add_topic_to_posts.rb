#Purpose of migration- Instructed the generator to create a migration that adds a topic_id column to the posts table

class AddTopicToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :topic_id, :integer
    add_index :posts, :topic_id #created an index on topic_id with the generator; index improves the speed of operations on a database table
  end
end

#Terminal command that generated migration
  ##rails generate migration AddTopicToPosts topic_id:integer:index
#Meaning of AddTopicToPosts
  ##"Add" + [table whose id we want to add] + "To" + [table we want to add the foreign key to] 
#Importance of indexing foreign key columns
  ##http://rny.io/rails/postgresql/2013/08/20/postgresql-indexing-in-rails.html  
     
