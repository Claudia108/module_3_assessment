require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase
  test "returns all items" do
    item1 = Item.create(id: 1, name: "Fork", description: "Description 1",
                    image_url: "http://images/image.png", created_at: "2012-06-12",
                    updated_at: "2014-12-12")
    item2 = Item.create(id: 2, name: "Knive", description: "Description 2",
                    image_url: "http://images/image.png", created_at: "2012-06-12",
                    updated_at: "2014-12-12")

    get "index", format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, parsed_json.count
    assert parsed_json.first.has_key?("id")
    assert parsed_json.first.has_key?("name")
    assert parsed_json.first.has_key?("description")
    refute parsed_json.first.has_key?("created_at")
    refute parsed_json.first.has_key?("updated_at")
  end
end
