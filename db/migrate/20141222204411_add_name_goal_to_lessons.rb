class AddNameGoalToLessons < ActiveRecord::Migration
  def change
  	add_column :lessons, :name, :text
  	add_column :lessons, :goal, :text
  end
end
