class HomeController < ApplicationController

  before_action :authenticate_user!,:except => [:index]
  load_and_authorize_resource
  def index
    @articles = Article.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
      format.js
    end
  end
end
