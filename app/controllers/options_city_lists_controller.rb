class OptionsCityListsController < ApplicationController
  before_action :set_options_city_list, only: [:show, :edit, :update, :destroy]

  # GET /options_city_lists
  # GET /options_city_lists.json
  def index
    @options_city_lists = OptionsCityList.all
  end

  # GET /options_city_lists/1
  # GET /options_city_lists/1.json
  def show
  end

  # GET /options_city_lists/new
  def new
    @options_city_list = OptionsCityList.new
  end

  # GET /options_city_lists/1/edit
  def edit
  end

  # POST /options_city_lists
  # POST /options_city_lists.json
  def create
    @options_city_list = OptionsCityList.new(options_city_list_params)

    respond_to do |format|
      if @options_city_list.save
        format.html { redirect_to @options_city_list, notice: 'Options city list was successfully created.' }
        format.json { render :show, status: :created, location: @options_city_list }
      else
        format.html { render :new }
        format.json { render json: @options_city_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /options_city_lists/1
  # PATCH/PUT /options_city_lists/1.json
  def update
    respond_to do |format|
      if @options_city_list.update(options_city_list_params)
        format.html { redirect_to @options_city_list, notice: 'Options city list was successfully updated.' }
        format.json { render :show, status: :ok, location: @options_city_list }
      else
        format.html { render :edit }
        format.json { render json: @options_city_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /options_city_lists/1
  # DELETE /options_city_lists/1.json
  def destroy
    @options_city_list.destroy
    respond_to do |format|
      format.html { redirect_to options_city_lists_url, notice: 'Options city list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_options_city_list
      @options_city_list = OptionsCityList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def options_city_list_params
      params.require(:options_city_list).permit(:location_option_id, :city_id)
    end
end
