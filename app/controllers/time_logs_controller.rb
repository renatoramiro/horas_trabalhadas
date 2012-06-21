class TimeLogsController < ApplicationController
  before_filter :setup_variables

  # GET /time_logs/new
  # GET /time_logs/new.json
  def new
    @time_log = TimeLog.new
    @time_log.user = @current_user
    @time_log.task_date = Date.today

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @time_log }
    end
  end

  # GET /time_logs/1/edit
  def edit
    @time_log = TimeLog.find(params[:id])
    params[:project_id] = @time_log.task_type.project.id
  end

  # POST /time_logs
  # POST /time_logs.json
  def create
    @time_log = TimeLog.new(params[:time_log])

    respond_to do |format|
      if @time_log.save
        flash[:notice] = 'Registro de tempo criado com sucesso.'
        format.html { redirect_to(:action => "new", :project_id => @time_log.task_type.project.id) }
        format.json { render json: @time_log, status: :created, location: @time_log }
      else
        format.html { render action: "new" }
        format.json { render json: @time_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /time_logs/1
  # PUT /time_logs/1.json
  def update
    @time_log = TimeLog.find(params[:id])

    respond_to do |format|
      if @time_log.update_attributes(params[:time_log])
        flash[:notice] = 'Registro de tempo atualizado com sucesso.'
        format.html { redirect_to(action: "new", :project_id => @time_log.task_type.project.id) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @time_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_logs/1
  # DELETE /time_logs/1.json
  def destroy
    @time_log = TimeLog.find(params[:id])
    @time_log.destroy

    respond_to do |format|
      flash[:notice] = "Registro removido com sucesso."
      format.html { redirect_to action: "new" }
      format.json { head :no_content }
    end
  end

private
  def setup_variables
    @time_logs = TimeLog.where("user_id = ?", @current_user.id).order("task_date DESC")
    @projects = @current_user.projects
    @task_types = params[:project_id] ? TaskType.find_all_by_project_id(params[:project_id]) : []
  end  
end
