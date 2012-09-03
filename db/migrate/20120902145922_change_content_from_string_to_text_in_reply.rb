class ChangeContentFromStringToTextInReply < ActiveRecord::Migration
  def up
    change_table :replies do |t|
      t.change :content, :text
    end
  end

  def down
    change_table :replies do |t|
      t.change :content, :string
    end
  end
end
