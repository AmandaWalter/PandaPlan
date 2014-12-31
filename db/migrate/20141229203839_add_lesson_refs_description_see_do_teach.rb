class AddLessonRefsDescriptionSeeDoTeach < ActiveRecord::Migration
  def change
  	add_column :lessons, :description, :text
  	add_column :lessons, :teacher_references, :text
  	add_column :lessons, :student_resources, :text
  	add_column :lessons, :see, :text
  	add_column :lessons, :do, :text
  	add_column :lessons, :teach, :text
  end
end
