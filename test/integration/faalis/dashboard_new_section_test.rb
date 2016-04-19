require 'test_helper'

class DashboardNewSectionTest < ActionDispatch::IntegrationTest
  setup do
    @user = Fabricate(:user, password: '12312312', password_confirmation: '12312312')
    login_as(@user)
  end


  test 'new section not contains content' do
    visit '/dashboard/posts/new'

    assert_selector '#post_raw_content'
    assert_no_selector '#post_content'
  end

end
