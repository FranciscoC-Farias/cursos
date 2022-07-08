class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :last_name
      t.integer :idade

      t.timestamps
    end
  end
end
