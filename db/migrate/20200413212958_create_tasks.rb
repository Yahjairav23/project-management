class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.integer :project_id
      t.integer :creator_id
      t.integer :assignee_id
      t.string :priority
      t.string :description
      t.date :due_date
      t.string :status

      t.timestamps 
    end
  end
end
