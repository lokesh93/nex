class AttachmentsController < ApplicationController
  before_action :set_attachment, only: [:show, :edit, :update, :destroy]

  # GET /attachments
  # GET /attachments.json
  def index
    @attachments = Attachment.all
  end

  # GET /attachments/1
  # GET /attachments/1.json
  def show
  end

  # GET /attachments/new
  def new
    @attachment = Attachment.new
  end

  # GET /attachments/1/edit
  def edit
  end

  def add_attachment_to_form
    @target = params[:target]
    @attachment = Attachment.new
    respond_to do |format|
      format.js
    end
  end
  # POST /attachments
  # POST /attachments.json
  def create
    @attachment = Attachment.create(attachment_params)
    @link = attachment_params["embedded_id"]
    if @link != "" && @link != nil
      if @link.include? "embed"
        @index =  @link.index('src=')
        @index =  @index + 35
        @final = @index + 11
        @embedded = ""
        while @index < @final
          @embedded = @embedded + @link[@index]
          @index = @index + 1
        end
        @attachment.embedded_id = @embedded
        @attachment.save
      elsif @link.include? "watch?v="
        if @link.split("watch?v=")[1].length() == 11
          @attachment.embedded_id = @link.split("watch?v=")[1]
          @attachment.save
        end
      elsif @link.include? "youtu.be"
        @attachment.embedded_id = @link.split('youtu.be/')[1]
        @attachment.save
      end
    end
  end

  # PATCH/PUT /attachments/1
  # PATCH/PUT /attachments/1.json
  def update
    respond_to do |format|
      if @attachment.update(attachment_params)
        format.html { redirect_to @attachment, notice: 'Attachment was successfully updated.' }
        format.json { render :show, status: :ok, location: @attachment }
      else
        format.html { render :edit }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attachments/1
  # DELETE /attachments/1.json
  def destroy
    @id = @attachment.id
    @attachment.destroy
    respond_to do |format|
      format.html { redirect_to attachments_url, notice: 'Attachment was successfully destroyed.' }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attachment
      @attachment = Attachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attachment_params
      params.require(:attachment).permit(:owner_id, :owner_type, :image, :embedded_id)
    end
end
