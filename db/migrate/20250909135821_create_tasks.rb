class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.string :task_title, null: false
      t.string :task_body, null: false
      t.timestamps
    end
  end
end
