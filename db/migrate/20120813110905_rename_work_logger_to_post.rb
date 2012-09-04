class RenameWorkLoggerToPost < ActiveRecord::Migration
  def change
    rename_table :work_loggers, :posts
  end

end
