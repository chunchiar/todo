class API::V1::CompleteController < API::BaseController

  def create
    # binding.pry
    @task = Task.find_by(id: params[:task_id])

    if @task.complete
      if @task.update(complete: false)
        render json: @task, message: "'#{@task.description}' was masked as uncompleted"
      else
        msg = {message: @task.errors.full_messages}
        render json: msg
      end
    else
      if @task.update(complete: true)
        render json: @task, message: "'#{@task.description}' was masked as completed"
      else
        msg = {message: @task.errors.full_messages}
        render json: msg
      end
    end

  end

end
