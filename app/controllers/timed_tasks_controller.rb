class TimedTasksController < ApplicationController
  before_action :set_timed_task, only: [:show, :edit, :update, :destroy]

  # GET /timed_tasks
  # GET /timed_tasks.json
  def index
    @timed_tasks = TimedTask.all
  end

  # GET /timed_tasks/1
  # GET /timed_tasks/1.json
  def show
  end

  # GET /timed_tasks/new
  def new
    @timed_task = TimedTask.new
  end

  # GET /timed_tasks/1/edit
  def edit
  end

  # POST /timed_tasks
  # POST /timed_tasks.json
  def create
    @timed_task = TimedTask.new(timed_task_params)

    respond_to do |format|
      if @timed_task.save
        format.html { redirect_to @timed_task, notice: 'Timed task was successfully created.' }
        format.json { render :show, status: :created, location: @timed_task }
      else
        format.html { render :new }
        format.json { render json: @timed_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /timed_tasks/1
  # PATCH/PUT /timed_tasks/1.json
  def update
    respond_to do |format|
      if @timed_task.update(timed_task_params)
        format.html { redirect_to @timed_task, notice: 'Timed task was successfully updated.' }
        format.json { render :show, status: :ok, location: @timed_task }
      else
        format.html { render :edit }
        format.json { render json: @timed_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timed_tasks/1
  # DELETE /timed_tasks/1.json
  def destroy
    @timed_task.destroy
    respond_to do |format|
      format.html { redirect_to timed_tasks_url, notice: 'Timed task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timed_task
      @timed_task = TimedTask.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def timed_task_params
      params.require(:timed_task).permit(:interval, :measure_of_time)
    end
end
