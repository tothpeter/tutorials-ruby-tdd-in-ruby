require 'test_helper'

class CreateCompetitionsTest < ActionDispatch::IntegrationTest
  # include Warden::Test::Helpers
  # Warden.test_mode!

  test "create competitions" do
    visit new_competition_path

    fill_in "Name", with: "Random"
    click_button "Submit"


    assert page.has_selector? ".flash.notice"
    assert page.has_content? "Completition created."
  end
end
