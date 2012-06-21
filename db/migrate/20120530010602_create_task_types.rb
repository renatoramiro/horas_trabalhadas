class CreateTaskTypes < ActiveRecord::Migration
  def change
    create_table :task_types do |t|
      t.string :name, :null => false, :limit => 50
      t.references :project, :null => false

      t.timestamps
    end
    add_index :task_types, [:project_id, :name], :unique => true
  end
end
