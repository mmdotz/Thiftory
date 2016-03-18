require "test_helper"

feature "Stats" do
  scenario "displays modal dropin on load", js: true do
    # skip("pending")

    login_user_for_test # failing on login
    visit stats_index_path
    within('.modal-dialog') do # Cap can't find class
      sleep 3
      binding.pry
      page.html
      page.must_have_content(Time.now)
    end
  end
end

feature "Stats" do
  scenario "displays only current_user_for_test's stats", js: true do
    # skip("pending")

    login_user_for_test
    visit stats_index_path

    page.must_have_content("Revenue")
  end
end
