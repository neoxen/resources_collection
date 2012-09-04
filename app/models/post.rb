# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  subject_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :title, :content, :user_id

  validates :title, :user_id, :subject_id, presence: true

  belongs_to :subject
  belongs_to :user
  has_many :replies
end
