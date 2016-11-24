class PhysicalLocationsController < ApplicationController
  before_action :set_physical_location, only: [:show, :edit, :update, :destroy]

  # GET /physical_locations
  # GET /physical_locations.json
  def index
    @physical_locations = PhysicalLocation.all
  end

  # GET /physical_locations/1
  # GET /physical_locations/1.json
  def show
  end

  # GET /physical_locations/new
  def new
    @physical_location = PhysicalLocation.new
  end

  # GET /physical_locations/1/edit
  def edit
  end

  # POST /physical_locations
  # POST /physical_locations.json
  def create
    @physical_location = PhysicalLocation.new(physical_location_params)

    respond_to do |format|
      if @physical_location.save
        format.html { redirect_to @physical_location, notice: 'Physical location was successfully created.' }
        format.json { render :show, status: :created, location: @physical_location }
      else
        format.html { render :new }
        format.json { render json: @physical_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /physical_locations/1
  # PATCH/PUT /physical_locations/1.json
  def update
    respond_to do |format|
      if @physical_location.update(physical_location_params)
        format.html { redirect_to @physical_location, notice: 'Physical location was successfully updated.' }
        format.json { render :show, status: :ok, location: @physical_location }
      else
        format.html { render :edit }
        format.json { render json: @physical_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /physical_locations/1
  # DELETE /physical_locations/1.json
  def destroy
    @physical_location.destroy
    respond_to do |format|
      format.html { redirect_to physical_locations_url, notice: 'Physical location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_physical_location
      @physical_location = PhysicalLocation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def physical_location_params
      params.require(:physical_location).permit(:address, :postal_code, :business_phone, :other_phone, :fax, :business_email, :business_website, :sale_location, :city_id, :vendor_id)
    end
end
