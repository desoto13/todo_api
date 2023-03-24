module Api
  module V1
    class TasksController < ApplicationController
      before_action :set_task, only: [:update, :destroy, :move_task]

      def index
        @tasks = Task.all.order("position ASC")
        render json: { to_do: @tasks.as_json( { only: [:id, :name, :description]} ) }, status: 200
      end
    
      def create
        @task = Task.new(task_params)
    
        if @task.save
          index
        else
          render json: { error: @task.error }, status: 422
        end
      end
    
      def update
        if @task.update(task_params)
          index
        else
          render json: { error: @task.error }, status: 422
        end
      end
    
      def destroy
        if @task.destroy
          index
        else
          render json: { error: @task.error }, status: 422
        end
      end

      def move_task
        TargetPositionService.call(@task, params[:target_position_ids])
        index
      end
    
      private
      def set_task
        @task = Task.find_by(id: params[:id])
      end

      def task_params
        params.require(:task).permit(:name, :description)
      end

    end
  end
end

