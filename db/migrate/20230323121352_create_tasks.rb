class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name, index: { unique: true }
      t.text :description
      t.integer :position
      t.timestamps
    end
  end
end
