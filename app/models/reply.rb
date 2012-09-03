# == Schema Information
#
# Table name: replies
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  user_id    :integer
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Reply < ActiveRecord::Base
  attr_accessible :content 

  belongs_to :post
  belongs_to :user

  validates :content, :user_id, :post_id, presence: true

  paginates_per 5
end
