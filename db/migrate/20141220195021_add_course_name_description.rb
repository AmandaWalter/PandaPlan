class AddCourseNameDescription < ActiveRecord::Migration
  def change
  	remove_column :courses, :index
  	add_column :courses, :description, :text
  	add_column :courses, :name, :text
  end
end
