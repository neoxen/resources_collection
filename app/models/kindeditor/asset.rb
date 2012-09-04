# == Schema Information
#
# Table name: kindeditor_assets
#
#  id         :integer          not null, primary key
#  asset      :string(255)
#  file_name  :string(255)
#  file_size  :integer
#  file_type  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Kindeditor::Asset < ActiveRecord::Base
  self.table_name =  "kindeditor_assets"
  validates_presence_of :asset
  before_save :update_asset_attributes
  attr_accessible :asset
  
  private
  def update_asset_attributes
    self.file_size = asset.file.size
    self.file_type = asset.file.content_type
  end
end
