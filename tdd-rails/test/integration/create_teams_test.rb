require 'test_helper'

class CreateTeamsTest < ActionDispatch::IntegrationTest
  test "creates teams" do
    visit new_team_path

    fill_in "Name", with: "Ruby team"
    click_button "Submit"

    assert page.has_selector?(".flash.notice", text: %q{Created team "Ruby team".})
  end
end
