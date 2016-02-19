# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  status      :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
