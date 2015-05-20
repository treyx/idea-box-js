require "rails_helper"

RSpec.feature "idea dashboard" do
  scenario "a user sees an idea" do
    idea = Idea.create(title: "New Idea", body: "this is the idea body")
    visit root_path
    within("#idea-list") do
      expect(page).to have_content(idea.title)
      expect(page).to have_content(idea.body)
    end
  end
end
