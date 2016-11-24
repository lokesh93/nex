class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save

        @users = []
        @users << @comment.user_id
        @post = @comment.post
        @user_activity = PublicActivity::Activity.create(owner: current_user,
               key: 'Post.commented_on_your_post',recipient: @post.user, trackable:@comment)
        if @user_activity.id != nil 
          @users << @post.user.id
          sync_new @user_activity, scope: @post.user
          sync_new @user_activity
        end
        @post.comments.each do |comment|
          if !(@users.include? comment.user.id) 
            @activity =PublicActivity::Activity.create(owner: current_user,
               key: 'Post.commented_on_a_post',recipient: comment.user, trackable:@comment)
            if @user_activity.id != nil 
              @users << comment.user.id
              sync_new @activity, scope: comment.user
              sync_new @activity
            end
          end
        end
        @post.bids.each do |bid|
          if !(@users.include? bid.user.id) 
            @activity =PublicActivity::Activity.create(owner: current_user,
               key: 'Post..commented_on_a_post',recipient: bid.user, trackable:@bid)
            if @user_activity.id != nil 
              @users << bid.user.id
              sync_new @activity, scope: bid.user
              sync_new @activity
            end
          end
        end

        format.html { redirect_to :back }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :post_id, :user_id)
    end
end
