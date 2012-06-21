class TaskTypesController < ApplicationController
  # GET /task_types/new
  # GET /task_types/new.json
  def new
    @task_type = TaskType.new
    @task_type.project = Project.find(params[:project_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task_type }
    end
  end

  # GET /task_types/1/edit
  def edit
    @task_type = TaskType.find(params[:id])
  end

  # POST /task_types
  # POST /task_types.json
  def create
    @task_type = TaskType.new(params[:task_type])

    respond_to do |format|
      if @task_type.save
        format.html { redirect_to @task_type.project, notice: 'Tipo de Tarefa criado com sucesso.' }
        format.json { render json: @task_type, status: :created, location: @task_type }
      else
        format.html { render action: "new" }
        format.json { render json: @task_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /task_types/1
  # PUT /task_types/1.json
  def update
    @task_type = TaskType.find(params[:id])

    respond_to do |format|
      if @task_type.update_attributes(params[:task_type])
        format.html { redirect_to @task_type.project, notice: 'Tipo de Tarefa atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_types/1
  # DELETE /task_types/1.json
  def destroy
    @task_type = TaskType.find(params[:id])
    @task_type.destroy

    respond_to do |format|
      format.html { redirect_to task_types_url }
      format.json { head :no_content }
    end
  end

  def task_types_by_project
    project_id = params[:id].to_i
    task_types = TaskType.where(:project_id => project_id)
    tts = []
    task_types.each do |tt|
      tts << {:id => tt.id, :n => tt.name}
    end
    render :json => {:tts => tts.compact}.as_json
  end
end
