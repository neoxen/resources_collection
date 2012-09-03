class CreateWorkLoggers < ActiveRecord::Migration
  def change
    create_table :work_loggers do |t| 
      t.string :title
      t.text :content
      t.integer :subject_id
      t.integer :user_id

      t.timestamps
    end
  end
end
