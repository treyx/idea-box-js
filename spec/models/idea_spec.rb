require 'rails_helper'

RSpec.describe Idea, type: :model do
  context "invalid attributes" do
    it "is invalid without a title" do
      idea = Idea.create(title: nil, body: "idea body")
      expect(idea).to_not be_valid
    end

    it "is invalid without a body" do
      idea = Idea.create(body: nil, title: "new idea")
      expect(idea).to_not be_valid
    end
  end
end
