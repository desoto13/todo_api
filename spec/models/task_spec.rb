require 'rails_helper'

RSpec.describe Task, type: :model do
  
  let(:new_task) { Task.new(name: 'grocery', description: 'buy milk and eggs')}

  describe '#CRUD_tests' do
    it 'should successfully create a new valid tasks' do
      expect(new_task.save).to be_truthy
    end

    it 'should be successfully updated' do
      new_task.save
      new_task.update(name: 'online')
      expect(new_task.name).to eq('online')
    end

    it 'should be successfully deleted' do
      new_task.save
      new_task.destroy
      expect(Task.find_by(name: 'grocery')).to eq(nil)
    end
  end

  let(:task_1) { Task.create(id: 1, name: 'online_grocery', description: 'online') }
  let(:task_2) { Task.create(id: 2, name: 'work', description: 'online') }
  let(:task_3) { Task.create(id: 3, name: 'study', description: 'online') }
  let(:task_4) { Task.create(id: 4, name: 'exercise', description: 'online') }
  let(:task_5) { Task.create(id: 5, name: 'place', description: 'online') }
  let(:task_6) { Task.create(id: 6, name: 'investment', description: 'online') }
  let(:task_7) { Task.create(id: 7, name: 'business', description: 'online') }
  let(:task_8) { Task.create(id: 8, name: 'real_estate', description: 'online') }

  describe '#Moving_tasks' do
    it 'should successfully move the task more than one task away from its current position' do
      task_8.insert_at(3)
      expect(task_8.position).to eq(3)
      p "successfully moved to from position 8 to position 3"
    end

    it 'should successfully move the task more than 50 times' do
      15.times do
        task_8.insert_at(3)
        expect(task_8.position).to eq(3)
        p "successfully moved to position 3"

        task_8.insert_at(7)
        expect(task_8.position).to eq(7)
        p "successfully moved to position 7"

        task_8.insert_at(1)
        expect(task_8.position).to eq(1)
        p "successfully moved to position 1"

        task_8.insert_at(8)
        expect(task_8.position).to eq(8)
        p "successfully moved to position 8"
      end
    end
  end

end