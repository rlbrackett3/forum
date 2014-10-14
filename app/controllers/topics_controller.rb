class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    @replies = Reply.all
  end

  def new
    @topic = Topic.new
  end

  def edit
  end
  
  def create
    @topic = Topic.new(topic_params)

    if @user.save #this should be @topic.save
      flash[:notice] = "Your topic was created."
      redirect_to topic_path @topic
    else
      flash[:alert] = "Error creating topic."
      redirect_to show_topic_path
    end
  end

  def update
    
  end

  def destroy
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topic_params
      params.require(:topic).permit(:title, :description)
    end
end
