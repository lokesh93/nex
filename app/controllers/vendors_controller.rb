class VendorsController < ApplicationController
  load_and_authorize_resource param_method: :vendor_params
  before_action :set_vendor, only: [:show, :edit, :update, :destroy]

  # GET /vendors
  # GET /vendors.json

  
  def index
    @categories = Category.all
    @cities = City.all
    @category = nil
    @cat_id = nil
    @subcat_id = nil
    @subcategor = nil
    @city = nil
    @vendors = Vendor.all

    if params[:city_id] != nil
      @city = params[:city_id]
      if params[:category_id] != nil
        @cat_id = params[:category_id]
        @category = Category.find(params[:category_id])
        @subcategories = @category.subcategories
        @subids = [];
        @subcategories.map{|x| @subids << x.id}
        if params[:subcategory_id] != nil
          @subcat_id = params[:subcategory_id]
          @subcategory = Subcategory.find(params[:subcategory_id])
          @vendors = Vendor.joins(:physical_locations, :vendor_subscriptions).where(:vendor_subscriptions =>{:subcategory_id => @subcategory.id}).where(:physical_locations => {city_id: @city}).all
        else
          @vendors = Vendor.joins(:physical_locations, :vendor_subscriptions).where(:vendor_subscriptions =>{:subcategory_id => @subcategories}).where(:physical_locations => {city_id: @city}).all
        end
      elsif params[:subcategory_id] != nil
        @subcat_id = params[:subcategory_id]
        @subcategory = Subcategory.find(params[:subcategory_id])
        @vendors = Vendor.joins(:physical_locations, :vendor_subscriptions).where(:vendor_subscriptions =>{:subcategory_id => @subcategory.id}).where(:physical_locations => {city_id: @city}).all
      else
        @vendors = Vendor.joins(:physical_locations).where(:physical_locations => {city_id: @city}).all
      end 
    end
    if params[:category_id] == nil
      @category = nil
      @subcategories = Subcategory.all
    else
      @cat_id = params[:category_id]
      @category = Category.find(params[:category_id])
      @subcategories = @category.subcategories
      @subids = [];
      @subcategories.map{|x| @subids << x.id}
      @vendors = Vendor.joins(:vendor_subscriptions).where(:vendor_subscriptions =>{:subcategory_id => @subcategories}).all
    end

    if params[:subcategory_id] == nil
      @subcategory = nil
    else
      @subcat_id = params[:subcategory_id]
      @subcategory = Subcategory.find(params[:subcategory_id])
      @vendors = Vendor.joins(:vendor_subscriptions).where(:vendor_subscriptions =>{:subcategory_id => @subcategory.id}).all
    end
    if params[:query] != nil && params[:query] != ""
      @vendors = Vendor.search(params[:query]);
    end
  end

  # GET /vendors/1
  # GET /vendors/1.json

  def show
    
    @current_raiting = Review.where.not(:raiting => nil)
    @current_raiting = @current_raiting.where(:user_id => current_user.id, :vendor_id => @vendor.id).first
    @reviews = Review.where(:vendor_id => @vendor.id)
    @review = Review.where(:user_id => current_user.id, :vendor_id => @vendor.id).first
    if generate_activity(@vendor.user)
      @activity = PublicActivity::Activity.create(owner: current_user,
       key: 'Vendor.has_viewed', recipient: @vendor.user, trackable: @vendor)
      # if @activity.id != nil
      #   sync_new @activity, scope: @vendor.user
      #   sync_new @activity
      # end
      # raise
    end
  end

  # GET /vendors/newi
  def new
    @vendor = Vendor.new
    @vendor.physical_locations.build
    @vendor.vendor_subscriptions.build
    @vendor.build_delivery_location
    @vendor.external_links.build
    @vendor.assets.build
    @vendor.personal_infos.build
end

  # GET /vendors/1/edit
  def edit
    
  end

  # POST /vendors
  # POST /vendors.json
  def user
    @vendor = Vendor.new(vendor_params)
    @vendor.user = current_user
    respond_to do |format|
      if @vendor.save
        format.html { redirect_to @vendor, notice: 'Vendor was successfully created.' }
        format.json { render :show, status: :created, location: @vendor }
      else
        format.html { render :new }
        format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vendors/1
  # PATCH/PUT /vendors/1.json
  def update
    respond_to do |format|
      if @vendor.update(vendor_params) 
        @vendor.vendor_subscriptions.each do |ven|
          @sub = ven.subcategory;
          @cat = @sub.category
        end 
        format.js { }
        # format.html { redirect_to @vendor, notice: 'Vendor was successfully updated.' }
        format.json { render :show, status: :ok, location: @vendor }
      else
        format.js{}
        format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendors/1
  # DELETE /vendors/1.json
  def destroy
    @vendor.destroy
    respond_to do |format|
      format.html { redirect_to vendors_url, notice: 'Vendor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vendor
      @vendor = Vendor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vendor_params
      params.require(:vendor).permit(
        # Vendor Attributes
        :business_name, :business_description, :establish_date, :tax_number, :shipping,
        payment_method_ids: [],
        # Physical Location Attributes
        physical_locations_attributes: [:_destroy, :id, :address, :postal_code, :business_phone,
          :other_phone, :fax, :business_email, :business_website, :sale_location, :city_id],
        # Vendor Subscription Attributes
        vendor_subscriptions_attributes: [:_destroy, :id, :subcategory_id],
        # Delivery Location Attributes
        delivery_locations_attributes: [:_destroy, :id, :city_id],
        # External Link Attributes
        external_links_attributes: [:_destroy, :id, :link, :external_source_id],
        # Asset Attributes (Pictures needs to nest inside assets in order to work)
        assets_attributes: [:_destroy, :id, :image],
        personal_infos_attributes: [:_destroy, :id, :legal_first_name,
          :legal_last_name, :preferred_name, :email, :title, :primary_phone, :secondary_phone],
        accepted_payment_methods_attributes: [:_destroy, :id, :payment_method_id, :preferred, :accepted]
        )
    end
end
