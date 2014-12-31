class LessonsController < ApplicationController
  before_action :set_course
  before_action :set_topic
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]

  def new
    @lesson = Lesson.new
  end

  def index
    @lessons = Lesson.all
  end

  def show
  end

  

  def edit
  end

  def create
    @lesson = @topic.lessons.create(lesson_params)

    respond_to do |format|
      if @lesson.save
        format.html { redirect_to @course, notice: 'Lesson was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @lesson.update(lesson_params)
        format.html { redirect_to @course, notice: 'Lesson was successfully updated.' }
        format.json { render :show, status: :ok, location: @lesson }
      else
        format.html { render :edit }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @lesson.destroy
    respond_to do |format|
      format.html { redirect_to @course, notice: 'Lesson was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end
    def set_course
        @course = Course.find(params[:course_id])
      end
      def set_topic
        @topic = Topic.find(params[:topic_id])
      end
    def lesson_params
      params.require(:lesson).permit(:name, :goal,:description, :teacher_references, :student_resources, :see, :do, :teach)
    end
end
