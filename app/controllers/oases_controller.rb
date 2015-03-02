class OasesController < ApplicationController
  # GET /oases
  # GET /oases.json
  def index
    @oases = Oasis.where("page_id=1")

    respond_to do |format|
      format.html{render :layout => 'oasis'} # index.html.erb
      format.json { render json: @oases }
    end
  end

  # GET /oases/1
  # GET /oases/1.json
  def show
    @oase = Oasis.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @oase }
    end
  end

  # GET /oases/new
  # GET /oases/new.json
  def new
    @oase = Oasis.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @oase }
    end
  end

  # GET /oases/1/edit
  def edit
    @oase = Oasis.find(params[:id])
  end

  # POST /oases
  # POST /oases.json
  def create

    if !params[:oasis]['id'].blank?
      @oase = Oasis.find(params[:oasis]['id'])
      @oase.page_id = params[:oasis]['page_id']
      @oase.description = params[:oasis]['description']
    else
      @oase = Oasis.new(params[:oasis])
    end
    respond_to do |format|
      if @oase.save
        format.html { redirect_to @oase, notice: 'Oasis was successfully created.' }
        format.json { render json: @oase, status: :created, location: @oase }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @oase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /oases/1
  # PUT /oases/1.json
  def update
    @oase = Oasis.find(params[:id])

    respond_to do |format|
      if @oase.update_attributes(params[:oase])
        format.html { redirect_to @oase, notice: 'Oasis was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @oase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /oases/1
  # DELETE /oases/1.json
  def destroy
    @oase = Oasis.find(params[:id])
    @oase.destroy

    respond_to do |format|
      format.html { redirect_to oases_url }
      format.json { head :no_content }
    end
  end

  def oases_by_page_id

    @oasis = Oasis.where("page_id=?",params[:page_id])
    respond_to do |format|
      format.json { render json: @oasis }
    end
  end
end
