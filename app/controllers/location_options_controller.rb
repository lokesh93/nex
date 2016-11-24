class LocationOptionsController < ApplicationController
  before_action :set_location_option, only: [:show, :edit, :update, :destroy]

  # GET /location_options
  # GET /location_options.json
  def index
    @location_options = LocationOption.all
  end

  # GET /location_options/1
  # GET /location_options/1.json
  def show
  end

  # GET /location_options/new
  def new
    @location_option = LocationOption.new
  end

  # GET /location_options/1/edit
  def edit
  end

  # POST /location_options
  # POST /location_options.json
  def create
    @location_option = LocationOption.new(location_option_params)

    respond_to do |format|
      if @location_option.save
        format.html { redirect_to @location_option, notice: 'Location option was successfully created.' }
        format.json { render :show, status: :created, location: @location_option }
      else
        format.html { render :new }
        format.json { render json: @location_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /location_options/1
  # PATCH/PUT /location_options/1.json
  def update
    respond_to do |format|
      if @location_option.update(location_option_params)
        format.html { redirect_to @location_option, notice: 'Location option was successfully updated.' }
        format.json { render :show, status: :ok, location: @location_option }
      else
        format.html { render :edit }
        format.json { render json: @location_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /location_options/1
  # DELETE /location_options/1.json
  def destroy
    @location_option.destroy
    respond_to do |format|
      format.html { redirect_to location_options_url, notice: 'Location option was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location_option
      @location_option = LocationOption.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_option_params
      params.require(:location_option).permit(:name)
    end
end
