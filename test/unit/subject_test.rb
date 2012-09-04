# == Schema Information
#
# Table name: subjects
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class SubjectTest < ActiveSupport::TestCase
  test "should not save without title" do
    subject = Subject.new
    assert !subject.save
  end
end
