class CreatePants < ActiveRecord::Migration
  def change
    create_table :pants do |t|
      t.integer :user_id
      t.string  :description

      t.timestamps null: false
    end
  end
end
