class AddCompletionDateToTask < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :date, :date
  end
end
