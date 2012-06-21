class CreateTimeLogs < ActiveRecord::Migration
  def change
    create_table :time_logs do |t|
      t.references :user, :null => false
      t.references :task_type, :null => false
      t.text :description
      t.date :task_date, :null => false
      t.time :worked_hours, :null => false

      t.timestamps
    end
    add_index :time_logs, :user_id
    add_index :time_logs, :task_type_id
  end
end
