class API::V1::TasksController < API::BaseController

  #skip_before_action :verify_authenticity_token, only: [:destroy]

  def index
    @tasks = Task.where(user_id: current_api_user.id)
    render json: @tasks

  end

  def create
    @task = current_api_user.tasks.build(task_params)

    if @task.save
      render json: @task, message: "'#{@task.description}' was created successfully"
    else
      msg = {message: @task.errors.full_messages}
      render json: msg
    end

  end

  def destroy
    @task = Task.find_by(id: params[:id])
    if @task.destroy
      render json: @task, message: "'#{@task.description}' was deleted"
    end
  end

  private

  def task_params
    params.require(:task).permit(:description)
  end


end
