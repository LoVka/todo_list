class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :project_id
      t.string :name
      t.string :status, null: false, default: 'unstarted'
      t.integer :priority, null: false
      t.datetime :deadline

      t.timestamps
    end

    add_index :tasks, :project_id
  end
end
