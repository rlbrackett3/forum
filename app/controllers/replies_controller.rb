class RepliesController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def index
    @replies = Reply.all
  end

  def show
    @reply = Reply.find(params[:id])
    @replies = Reply.all
  end

  def new
    @reply = Reply.new
  end

  def edit
  end
  
  def create
    @reply = Reply.new(reply_params)

    if @reply.save
      flash[:notice] = "Your reply was created."
      redirect_to topic_path @reply
    else
      flash[:alert] = "Error creating reply."
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
      @reply = Reply.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reply_params
      params.require(:reply).permit(:title, :body, :user_id, :topic_id)
    end
end
