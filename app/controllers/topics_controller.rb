class TopicsController < ApplicationController
	before_action :set_course
	before_action :set_topic, only: [:show, :edit, :update, :destroy]
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

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to @course, notice: 'Topic was successfully updated.' }
        format.json { render :show, status: :ok, location: @topic }
      else
        format.html { render :edit }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end 

	def destroy
	    @topic.destroy
	    respond_to do |format|
	      format.html { redirect_to @course, notice: 'Topic was successfully destroyed.' }
	      format.json { head :no_content }
	    end
	  end

	private

	def topic_params
		params.require(:topic).permit(:name, :description)
	end
	def set_course
    @course = Course.find(params[:course_id])
  end
  def set_topic
  	@topic = Topic.find(params[:id])
  end
end
