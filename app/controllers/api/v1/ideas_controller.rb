class Api::V1::IdeasController < ApplicationController
  respond_to :json
  def index
    respond_with Idea.all
  end

  def show
    respond_with Idea.find_by(id: params[:id])
  end
end
