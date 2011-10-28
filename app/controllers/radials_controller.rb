class RadialsController < ApplicationController
  # GET /radials
  # GET /radials.json
  def index
    @radials = Radial.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @radials }
    end
  end

  # GET /radials/1
  # GET /radials/1.json
  def show
    @radial = Radial.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @radial }
    end
  end

  # GET /radials/new
  # GET /radials/new.json
  def new
    @radial = Radial.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @radial }
    end
  end

  # GET /radials/1/edit
  def edit
    @radial = Radial.find(params[:id])
  end

  # POST /radials
  # POST /radials.json
  def create
    @radial = Radial.new(params[:radial])

    respond_to do |format|
      if @radial.save
        format.html { redirect_to @radial, notice: 'Radial was successfully created.' }
        format.json { render json: @radial, status: :created, location: @radial }
      else
        format.html { render action: "new" }
        format.json { render json: @radial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /radials/1
  # PUT /radials/1.json
  def update
    @radial = Radial.find(params[:id])

    respond_to do |format|
      if @radial.update_attributes(params[:radial])
        format.html { redirect_to @radial, notice: 'Radial was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @radial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /radials/1
  # DELETE /radials/1.json
  def destroy
    @radial = Radial.find(params[:id])
    @radial.destroy

    respond_to do |format|
      format.html { redirect_to radials_url }
      format.json { head :ok }
    end
  end
end
