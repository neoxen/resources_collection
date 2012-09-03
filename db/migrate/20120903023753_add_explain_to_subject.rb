class AddExplainToSubject < ActiveRecord::Migration
  def change 
    add_column :subjects, :explain, :string
  end
end
