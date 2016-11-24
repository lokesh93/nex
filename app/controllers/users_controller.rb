class UsersController < ApplicationController
  load_and_authorize_resource param_method: :user_params
  before_action :set_user, only: [:show, :edit, :update, :destroy, :show_account]

  #dashboard//
  def overview

    
    if @user.account_type == "Consumer"
      @consumer = @user.account
      @profileGallery =  @consumer.galleries.where(name: "Profile_Pictures", owner_id: @consumer.id, owner_type: "Consumer")
      if @profileGallery.empty?
        @consumer.galleries.create(name: "Profile_Pictures", owner_id: @consumer.id, owner_type: "Consumer", user_id: current_user.id)
        @consumer.save
        @profileGallery =  @consumer.galleries.where(name: "Profile_Pictures", owner_id: @consumer.id, owner_type: "Consumer")
      end
    else
      @vendor = @user.account
      @profileGallery =  @vendor.galleries.where(name: "Profile_Pictures", owner_id: @vendor.id, owner_type: "Vendor")
      if !@profileGallery
        @vendor.galleries.create(name: "Profile_Pictures", owner_id: @vendor.id, owner_type: "Vendor", user_id: current_user.id)
        @vendor.save
        @profileGallery =  @vendor.galleries.where(name: "Profile_Pictures", owner_id: @vendor.id, owner_type: "Vendor")
      end
    end
    @profileGallery = @profileGallery.first
    @posts = Post.all.limit(2)
    @user_posts = @user.posts
    @filter = "All"
    @messages = current_user.conversations.includes(:messages).where.not(:messages => {:user_id => current_user.id}).where(:messages => {:read => nil})
  end

  def inbox
    @convos = @user.conversations.where.not(last_msg: nil)
  end
  def watched_posts
    @watchedPosts = @user.watched_posts
  end
  def bids
    if params[:filter] == "All"
      @filter = params[:filter]
      @bids = @user.bids.where(:legacy => false).order('id DESC')
    elsif params[:filter] == "won_active"
      @filter = "Won \u2022 Active"
      @bids = @user.bids.where(:status => "accepted", :legacy => false).order('id DESC')
      @bids = @bids.reject{|r| r.active? == false}
    elsif params[:filter] == "won_complete"
      @filter = "Won \u2022 Complete"
      @bids = @user.bids.where(:status => "accepted", :legacy => false).order('id DESC')
      @bids = @bids.reject{|r| r.active? == false}
    elsif params[:filter] == "lost"
      @filter = "Lost"
      @bids = @user.bids.where(:status => "Lost", :legacy => false).order('id DESC')
    elsif params[:filter] == "cancelled"
      @filter = "Cancelled"
      @bids = @user.bids.where(:status => "cancelled", :legacy => false).order('id DESC')
    else
      @filter = "All"
      @bids = @user.bids.where(:legacy => false, :legacy => false).order('id DESC')
    end
  end

  def statistics
  end

  def profile
  end

  def manage_posts
    @posts = current_user.posts
  end

  def account
    if @user.account_type == 'Vendor'
      @vendor = @user.account
      @vendor.physical_locations.build
      @vendor.vendor_subscriptions.build
      @vendor.delivery_locations.build
      @vendor.service_locations.build
      @vendor.external_links.build
      @vendor.personal_infos.build
      @vendor.accepted_payment_methods.build
      if @vendor.created_at == @vendor.updated_at
        @newVendor = true
      else
        @newVendor = true
      end
      @profileGallery =  @vendor.galleries.where(name: "Profile_Pictures", owner_id: @vendor.id, owner_type: "Vendor")
      if@profileGallery.empty?
        @vendor.galleries.create(name: "Profile_Pictures", owner_id: @vendor.id, owner_type: "Vendor", user_id: current_user.id)
        @profileGallery =  @vendor.galleries.where(name: "Profile_Pictures", owner_id: @vendor.id, owner_type: "Vendor")
      end
      @profileGallery = @profileGallery.first
      @coverGallery =  @vendor.galleries.where(name: "Cover_Pictures", owner_id: @vendor.id, owner_type: "Vendor")
      if@coverGallery.empty?
        @vendor.galleries.create(name: "Cover_Pictures", owner_id: @vendor.id, owner_type: "Vendor", user_id: current_user.id)
        @coverGallery =  @vendor.galleries.where(name: "Cover_Pictures", owner_id: @vendor.id, owner_type: "Vendor")
      end
      @coverGallery = @coverGallery.first
      @mediaGallery =  @vendor.galleries.where(name: "Media", owner_id: @vendor.id, owner_type: "Vendor")
      if@mediaGallery.empty?
        @vendor.galleries.create(name: "Media", owner_id: @vendor.id, owner_type: "Vendor", user_id: current_user.id)
        @mediaGallery =  @vendor.galleries.where(name: "Media", owner_id: @vendor.id, owner_type: "Vendor")
      end
      @mediaGallery = @mediaGallery.first

    else
      @consumer = @user.account
    end
  end

  #dashbboard-end//

  # GET /users
  # GET /users.json
  def read
    @activities = PublicActivity::Activity.where(recipient_id: current_user.id, read: false).order(created_at: :desc)
    @activities.each do |act|
      act.read = true;
      act.save
    end
  end
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    if @user.new?
      if @user.is_vendor?
        redirect_to new_vendor_path
      else
        @consumer = Consumer.new
        @consumer.save
        @consumer.user = current_user
        @consumer.save
      end
    else
      redirect_to @user.account, notice: 'User Logged in'
    end
  end

  def show_account
    if @user.is_vendor?
      redirect_to vendor_path(@user.account.id)
    else
      redirect_to consumer_path(@user.account.id)
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @username = nil
    @user.first_name = @user.first_name.delete(" ")
    @user.last_name = @user.last_name.delete(" ")
    @name = @user.first_name + "_" + @user.last_name
    @number = ""
    while @username == nil
      @check = @name + @number
      if User.where(:username => @check).empty?
        @username = @check
      else
        @number = (@number.to_i + 1).to_s
      end
    end
    @user.username = @username
    respond_to do |format|
      if @user.save
        if @user.account_type == "Vendor"
          vendor_account = Vendor.create
          @vendor = vendor_account
          @user.update(account: vendor_account)
          EmailNotificationSetting.create(settings_for: 'Vendor', timed_task: TimedTask.first, user: @user)
          EmailNotificationSetting.create(settings_for: 'Bid', timed_task: TimedTask.first, user: @user)
          @vendor.galleries.create(name: "Cover_Pictures", owner_id: @vendor.id, owner_type: "Vendor", user_id: @user.id)
          @vendor.galleries.create(name: "Profile_Pictures", owner_id: @vendor.id, owner_type: "Vendor")
          @vendor.galleries.create(name: "Media", owner_id: @vendor.id, owner_type: "Vendor", user_id: @user.id)
        else
          consumer_account = Consumer.create
          consumer_account.city_id = params[:city_id]
          consumer_account.save
          consumer_account.galleries.create(name: "Profile_Pictures", owner_id: consumer_account.id, owner_type: "Consumer")
          @user.update(account: consumer_account)
        end
        EmailNotificationSetting.create(settings_for: 'Conversation', timed_task: TimedTask.first, user: @user)
        EmailNotificationSetting.create(settings_for: 'Post', timed_task: TimedTask.first, user: @user)
        EmailNotificationSetting.create(settings_for: 'Comment', timed_task: TimedTask.first, user: @user)
        UserMailer.new_user_welcome(@user).deliver
        if @user.account_type == "Vendor"
          format.html { redirect_to  account_user_path(@user,:new_user => true)}
        else
          format.html { redirect_to  overview_user_path(@user)}
        end
        format.json { render :show, status: :created, location: @user }
      else
        format.html { redirect_to root_path(:error => "join"), notice: @user.errors.full_messages * ', ' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.valid_password?(params[:user][:old_password])
        if @user.update(user_params) 
          format.html { redirect_to :back, notice: 'User was successfully updated.' }
          format.json { render :show, status: :ok, location: @user }
        else
          raise
          format.html { render :edit, notice: 'Passwords did not match'}
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      else
        format.html { redirect_to :back, notice: 'Old password was incorrect' }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.permit(:username, :email, :password, :password_confirmation, :account_type, :first_name,:last_name)
    end
end
