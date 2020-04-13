class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.string :bio
      t.integer :team_id

      t.timestamps
    end
  end
end
