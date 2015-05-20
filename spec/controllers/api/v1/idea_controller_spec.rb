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


  it "responds to #create" do
    idea = Idea.new(title: "title", body: "body")
    expect do
      post :create, format: :json, idea: { title: idea.title, body: idea.body }

      idea = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(201)

      expect(idea[:title]).to eq("title")
      expect(idea[:body]).to eq("body")
    end.to change{ Idea.count }.from(0).to(1)
  end

  it "responds to #update" do
    old_idea = Idea.create(title: "title", body: "body")
    expect(Idea.first.title).to eq(old_idea.title)
    put :update, format: :json, id: old_idea.id, idea: { title: "new title", body: "new body"}
    expect(Idea.first.title).to eq("new title")
    expect(Idea.first.body).to eq("new body")
    expect(response.status).to eq(204)
  end

  it "responds to #destroy" do
    idea = Idea.create(title: "title", body: "body")
    expect do
      delete :destroy, format: :json, id: idea.id
    end.to change{ Idea.count }.from(1).to(0)
  end
end
