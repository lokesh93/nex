class VendorSubscriptionsController < ApplicationController
  before_action :set_vendor_subscription, only: [:show, :edit, :update, :destroy]

  # GET /vendor_subscriptions
  # GET /vendor_subscriptions.json
  def index
    @vendor_subscriptions = VendorSubscription.all
  end

  # GET /vendor_subscriptions/1
  # GET /vendor_subscriptions/1.json
  def show
  end

  # GET /vendor_subscriptions/new
  def new
    @vendor_subscription = VendorSubscription.new
  end

  # GET /vendor_subscriptions/1/edit
  def edit
  end

  # POST /vendor_subscriptions
  # POST /vendor_subscriptions.json
  def create
    @vendor_subscription = VendorSubscription.new(vendor_subscription_params)

    respond_to do |format|
      if @vendor_subscription.save
        format.html { redirect_to @vendor_subscription, notice: 'Vendor subscription was successfully created.' }
        format.json { render :show, status: :created, location: @vendor_subscription }
      else
        format.html { render :new }
        format.json { render json: @vendor_subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vendor_subscriptions/1
  # PATCH/PUT /vendor_subscriptions/1.json
  def update
    respond_to do |format|
      if @vendor_subscription.update(vendor_subscription_params)
        format.html { redirect_to @vendor_subscription, notice: 'Vendor subscription was successfully updated.' }
        format.json { render :show, status: :ok, location: @vendor_subscription }
      else
        format.html { render :edit }
        format.json { render json: @vendor_subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendor_subscriptions/1
  # DELETE /vendor_subscriptions/1.json
  def destroy
    @vendor_subscription.destroy
    respond_to do |format|
      format.html { redirect_to vendor_subscriptions_url, notice: 'Vendor subscription was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vendor_subscription
      @vendor_subscription = VendorSubscription.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vendor_subscription_params
      params.require(:vendor_subscription).permit(:vendor_id, :subcategory_id)
    end
end
