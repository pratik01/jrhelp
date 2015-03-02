class ArticlesController < ApplicationController

  before_filters :authenticate_user!,:except => [:show]
  load_and_authorize_resource
  # GET /articles
  # GET /articles.json
  def index
    if user_signed_in?
     # @articles = Article.where("user_id=?",current_user.id)
      @articles = Article.search(params[:q])
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @articles }
        format.js
      end
    else
      redirect_to "/users/sign_in"
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])
    @step = Step.where("article_id = ?",@article.id)
    @comments = Comment.where("flag=1 AND article_id=?",@article.id)
    @comment = Comment.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
    if user_signed_in?
      @article = Article.new
      @step = Step.new
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @article }

      end
    else
      redirect_to "/users/sign_in"
    end

  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(params[:article])

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render json: @article, status: :created, location: @article }
        format.js { render data: @article }
      else
        format.html { render action: "new" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end
end
