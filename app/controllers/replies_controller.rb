class RepliesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reply, only: [:edit, :update, :show, :destroy]
  before_action :set_discussion, only: [:create, :edit, :show, :update, :destroy]

  def create
    @reply = @discussion.replies.create(params[:reply].permit(:reply_post, :discussion_id))
    @reply.user_id = current_user.id

    respond_to do |format|
      if @reply.save
        format.html { redirect_to discussion_path(@discussion) }
      else
        format.html { redirect_to discussion_path(@discussion), alert: "Reply did not save. Please try again."}
      end
    end
  end

  def new
  end


  def destroy
    @reply = @discussion.replies.find(params[:id])
    @reply.destroy
    redirect_to discussion_path(@discussion)
  end

  def edit
    @discussion = Discussion.find(params[:discussion_id])
    @reply = @discussion.replies.find(params[:id])
  end

  def update
    @reply = @discussion.replies.find(params[:id])
    
     respond_to do |format|
      if @reply.update(reply_params)
        format.html { redirect_to discussion_path(@discussion), notice: 'Reply was successfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end
  
  
  def vote
    value = params[:type] == "up" ? 1 : -1
    @reply = Reply.find(params[:id])
    @reply.add_or_update_evaluation(:votes, value, current_user)
    redirect_to :back, notice: "Thank you for voting!"
  end
  
  

  private

  def set_discussion
    @discussion = Discussion.find(params[:discussion_id])
  end

  def set_reply
    @reply = Reply.find(params[:id])
  end

  def reply_params
    params.require(:reply).permit(:reply_post, :discussion_id)
  end
end