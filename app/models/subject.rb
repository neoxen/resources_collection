# == Schema Information
#
# Table name: subjects
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Subject < ActiveRecord::Base
  # attr_accessible :title, :body

  attr_accessible :title, :explain
  validates :title, :explain, presence: true

  has_many :posts
  accepts_nested_attributes_for :posts
end
