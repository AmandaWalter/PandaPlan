class TopicsController < ApplicationController
	before_action :set_course
	def new
		@topic = Topic.new
	end

	def create
    @topic = @course.topics.create(topic_params)

    respond_to do |format|
      if @topic.save
        format.html { redirect_to @course, notice: 'Topic was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

	private

	def topic_params
		params.require(:topic).permit(:name, :description)
	end

	def set_course
      @course = Course.find(params[:course_id])
    end
end
