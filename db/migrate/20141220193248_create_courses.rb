class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :index

      t.timestamps
    end
  end
end
