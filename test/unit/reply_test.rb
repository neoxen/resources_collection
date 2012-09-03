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

require 'test_helper'

class ReplyTest < ActiveSupport::TestCase

  test "should not save without content" do
    reply = Reply.new
    assert !reply.save
  end

  test "should not save without user" do
    assert !replies(:without_user).save
  end

  test "should not save without post" do
    assert !replies(:without_post).save
  end
end
