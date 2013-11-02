class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.integer :user_id
      t.string :description
      t.boolean :completed, :null => false, :default => false

      t.timestamps
    end
  end
end
