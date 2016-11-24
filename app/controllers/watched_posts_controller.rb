class WatchedPostsController < ApplicationController
  before_action :set_watched_post, only: [:show, :edit, :update, :destroy]

  # GET /watched_posts
  # GET /watched_posts.json
  def index
    @watched_posts = WatchedPost.all
  end

  # GET /watched_posts/1
  # GET /watched_posts/1.json
  def show
  end

  # GET /watched_posts/new
  def new
    @watched_post = WatchedPost.new
  end

  # GET /watched_posts/1/edit
  def edit
  end

  # POST /watched_posts
  # POST /watched_posts.json
  def create

    if WatchedPost.where(user_id: params[:watched_post][:user_id], post_id: params[:watched_post][:post_id]).empty?
      @watched_post = WatchedPost.new(watched_post_params)

      respond_to do |format|
        if @watched_post.save
          format.html { redirect_to :back, notice: 'Watched post was successfully created.' }
          format.json { render :show, status: :created, location: @watched_post }
        else
          format.html { render :new }
          format.json { render json: @watched_post.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to watched_posts_user_path(current_user)
    end

  end

  # PATCH/PUT /watched_posts/1
  # PATCH/PUT /watched_posts/1.json
  def update
    respond_to do |format|
      if @watched_post.update(watched_post_params)
        format.html { redirect_to @watched_post, notice: 'Watched post was successfully updated.' }
        format.json { render :show, status: :ok, location: @watched_post }
      else
        format.html { render :edit }
        format.json { render json: @watched_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /watched_posts/1
  # DELETE /watched_posts/1.json
  def destroy
    @watched_post.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Watched post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_watched_post
      @watched_post = WatchedPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def watched_post_params
      params.require(:watched_post).permit(:user_id, :post_id)
    end
end
