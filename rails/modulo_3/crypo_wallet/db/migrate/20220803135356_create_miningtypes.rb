class CreateMiningtypes < ActiveRecord::Migration[6.1]
  def change
    create_table :miningtypes do |t|
      t.string :name
      t.string :acronym

      t.timestamps
    end
  end
end
