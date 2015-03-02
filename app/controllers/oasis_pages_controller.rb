class OasisPagesController < ApplicationController
  # GET /oasis_pages
  # GET /oasis_pages.json
  def index
    @oasis_pages = OasisPage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @oasis_pages }
    end
  end

  # GET /oasis_pages/1
  # GET /oasis_pages/1.json
  def show
    @oasis_page = OasisPage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @oasis_page }
    end
  end

  # GET /oasis_pages/new
  # GET /oasis_pages/new.json
  def new
    @oasis_page = OasisPage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @oasis_page }
    end
  end

  # GET /oasis_pages/1/edit
  def edit
    @oasis_page = OasisPage.find(params[:id])
  end

  # POST /oasis_pages
  # POST /oasis_pages.json
  def create
    @oasis_page = OasisPage.new(params[:oasis_page])

    respond_to do |format|
      if @oasis_page.save
        format.html { redirect_to @oasis_page, notice: 'Oasis page was successfully created.' }
        format.json { render json: @oasis_page, status: :created, location: @oasis_page }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @oasis_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /oasis_pages/1
  # PUT /oasis_pages/1.json
  def update
    @oasis_page = OasisPage.find(params[:id])

    respond_to do |format|
      if @oasis_page.update_attributes(params[:oasis_page])
        format.html { redirect_to @oasis_page, notice: 'Oasis page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @oasis_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /oasis_pages/1
  # DELETE /oasis_pages/1.json
  def destroy
    @oasis_page = OasisPage.find(params[:id])
    @oasis_page.destroy

    respond_to do |format|
      format.html { redirect_to oasis_pages_url }
      format.json { head :no_content }
    end
  end
end
