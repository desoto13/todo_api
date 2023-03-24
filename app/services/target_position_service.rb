class TargetPositionService < ApplicationService
  def initialize(task, target_position_ids)
    @task = task
    @target_position_ids = target_position_ids
  end

  def call
    target_position_ids_array = JSON.parse(@target_position_ids)
    target_position = [] 
    
    p @target_position_ids
    p target_position_ids_array
    target_position_ids_array.each { |id| target_position << Task.find_by(id: id).position }

    if target_position_ids_array.length == 3 && target_position[1] == target_position.max
      @task.insert_at(target_position[2])
    elsif target_position_ids_array.length == 3 && target_position[1] == target_position.min
      @task.insert_at(target_position[0])
    elsif target_position_ids_array.length == 2 && target_position_ids_array[0] == @task.id
      @task.insert_at(target_position[1])
    elsif target_position_ids_array.length == 2 && target_position_ids_array[1] == @task.id
      @task.insert_at(target_position[0]+1)
    end

  end

end