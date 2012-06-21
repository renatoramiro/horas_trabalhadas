class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name, :nul => false, :limit => 50
      t.text :description

      t.timestamps
    end
    add_index :projects, :name, :unique
  end
end
