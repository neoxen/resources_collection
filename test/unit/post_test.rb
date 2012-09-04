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

require 'test_helper'

class PostTest < ActiveSupport::TestCase

  test "should not save post without title" do
    assert !posts(:without_title).save, "saved the post without a title"
  end

  test "should not save post without user" do
    assert !posts(:without_user).save
  end

  test "should not save post without subject" do
    assert !posts(:without_subject).save
  end

  test "should save post with title and user" do
    assert posts(:normal).save
  end

end
