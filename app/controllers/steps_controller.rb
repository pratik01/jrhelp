class StepsController < ApplicationController
  # GET /steps
  # GET /steps.json
  def index
    @steps = Step.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @steps }
    end
  end

  # GET /steps/1
  # GET /steps/1.json
  def show
    @step = Step.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @step }
    end
  end

  # GET /steps/new
  # GET /steps/new.json
  def new
    @step = Step.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @step }
    end
  end

  # GET /steps/1/edit
  def edit
    @step = Step.find(params[:id])
  end

  # POST /steps
  # POST /steps.json
  def create
    if !params[:step]['id'].blank?
      @step = Step.find(params[:step]['id'])
      @step.article_id = params[:step]['article_id']
      @step.description = params[:step]['description']
    else
      @step = Step.new(params[:step])
    end
    #@step_params = params[:step]
    #data = false
    #@step_params.each do |s|
    #  @step = Step.new
    #  @step.article_id = s['article_id']
    #  @step.type = s['type']
    #  @step.description = s['description']
    #  puts @step.to_json
    #  if @step.save
    #    data = true
    #  else
    #    data = false
    #  end
    #end
    respond_to do |format|
      data = false
      if @step.save
        data = true
        format.html # new.html.erb
        format.json { render json: data }
        format.js
      else
        format.html # new.html.erb
        format.json { render json: data }
        format.js
      end
    end
  end

  def step_by_article_id
    @step = Step.where("article_id = ?",params[:article_id])
    respond_to do |format|
      format.json { render json: @step }
    end
  end

  # PUT /steps/1
  # PUT /steps/1.json
  def update
    @step = Step.find(params[:id])

    respond_to do |format|
      if @step.update_attributes(params[:step])
        format.html { redirect_to @step, notice: 'Step was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /steps/1
  # DELETE /steps/1.json
  def destroy
    @step = Step.find(params[:id])
    @step.destroy

    respond_to do |format|
      format.html { redirect_to steps_url }
      format.json { head :no_content }
    end
  end
end
