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

class Kindeditor::File < Kindeditor::Asset
  mount_uploader :asset, Kindeditor::FileUploader
end
