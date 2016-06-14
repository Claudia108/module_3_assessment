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
    assert parsed_json.first.has_key?("name")
    assert parsed_json.first.has_key?("description")
    refute parsed_json.first.has_key?("created_at")
    refute parsed_json.first.has_key?("updated_at")
  end

  test "return one item" do
    item = Item.create(id: 1, name: "Fork", description: "Description 1",
                    image_url: "http://images/image.png", created_at: "2012-06-12",
                    updated_at: "2014-12-12")
    id = item.id

    get "show", id: id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal "Fork", parsed_json["name"]
    assert_equal "Description 1", parsed_json["description"]
    assert_equal "http://images/image.png", parsed_json["image_url"]

    refute parsed_json.has_key?("created_at")
    refute parsed_json.has_key?("updated_at")
  end

  test "deletes one item" do
    item = Item.create(id: 1, name: "Fork", description: "Description 1",
                    image_url: "http://images/image.png", created_at: "2012-06-12",
                    updated_at: "2014-12-12")
    id = item.id
    delete "destroy", id: id, format: :json

    assert_response 204
    assert_equal "", response.body
  end

  # test "posts one item" do
  #   item = Item.create(id: 1, name: "Fork", description: "Description 1",
  #                   image_url: "http://images/image.png", created_at: "2012-06-12",
  #                   updated_at: "2014-12-12")
  #   id = item.id
  #   name = item.name
  #   description = item.description
  #   image_url = item.image_url
  #
  #   post "create", name: name, description: description, image_url: image_url, format: :json
  #   parsed_json = JSON.parse(response.body)
  #
  #   assert_response 201
  #   assert_equal "Fork", parsed_json["name"]
  #   assert_equal "Description 1", parsed_json["description"]
  #   assert_equal "http://images/image.png", parsed_json["image_url"]
  # end

end
