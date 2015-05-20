require "rails_helper"

RSpec.describe Api::V1::IdeasController, type: :controller do
  it "responds to #index" do
    idea = Idea.create(title: "title", body: "body")
    get :index, format: :json

    ideas = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(200)

    expect(ideas.first[:title]).to eq(idea.title)
    expect(ideas.first[:body]).to eq(idea.body)
  end

  it "responds to #show" do
    idea = Idea.create(title: "title", body: "body")
    get :show, format: :json, id: idea.id

    first_idea = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(200)

    expect(first_idea[:title]).to eq(idea.title)
    expect(first_idea[:body]).to eq(idea.body)
  end
end
