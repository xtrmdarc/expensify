require 'test_helper'

class ExpenseCategoryControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get expense_category_index_url
    assert_response :success
  end
end
