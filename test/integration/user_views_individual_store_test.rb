require 'test_helper'

class UserViewsIndividualStoreTest < ActionDispatch::IntegrationTest
  def setup
    Capybara.app = Storedom::Application
  end

  test "user individual store" do
    stores = Store.find_by("80202")
    store = stores.last

    visit '/'
    within('.navbar-form') do
      fill_in "zip", with: "80202"
      click_button("Search")
    end

    assert_equal '/search', current_path
    assert page.has_link?("Best Buy - S.E. Aurora")
    click_link("Best Buy - S.E. Aurora")

    assert_equal "/search/#{store.storeId}", current_path

    assert_equal "Best Buy - S.E. Aurora", store.longName
    assert_equal "BigBox", store.storeType
    assert_equal "5999 S Southlands Pkwy", store.address
    assert_equal "Aurora", store.city
    assert_equal "CO", store.region
    assert_equal "80016", store.fullPostalCode
    assert_equal "Mon: 10am-9pm; Tue: 10am-9pm; Wed: 10am-9pm; Thurs: 10am-9pm; Fri: 10am-9pm; Sat: 10am-9pm; Sun: 10am-8pm", store.hoursAmPm
  end
end
