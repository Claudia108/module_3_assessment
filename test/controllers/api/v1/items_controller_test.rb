require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase

  test "returns all items" do
    items = Item.all

    get "index", format: :json
    parsed_json = JSON.parse(response.body)

    assert_equal, page.status_code
    assert items.first.has_key?("name")
    assert items.first.has_key?("description")
    assert items.first.has_key?("image_url")
    refute items.first.has_key?("updated_at")
  end
end
