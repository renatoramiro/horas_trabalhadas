class CreateSummaryReports < ActiveRecord::Migration
  def change
    create_table :summary_reports do |t|
      t.references :project
      t.references :task_type
      t.references :user

      t.timestamps
    end
    add_index :summary_reports, :project_id
    add_index :summary_reports, :task_type_id
    add_index :summary_reports, :user_id
  end
end
