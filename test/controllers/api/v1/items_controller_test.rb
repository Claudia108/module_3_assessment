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
    assert_equal 2, parsed_json.first.count
    assert_equal 1, parsed_json.first.id
    assert_equal "Fork", parsed_json.name
    refute_equal "http://images/image.png", parsed_json.first.image_url
  end
end
