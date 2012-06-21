class CreateProjectMemberships < ActiveRecord::Migration
  def change
    create_table :project_memberships do |t|
      t.date :joined, :null => false
      t.date :leaved
      t.references :user, :null => false
      t.references :project, :null => false

      t.timestamps
    end
    add_index :project_memberships, [:user_id, :project_id], :unique => true
  end
end
