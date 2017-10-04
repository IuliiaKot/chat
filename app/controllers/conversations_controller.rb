class ConversationsController < ApplicationController
  def create
        # debugger
    @conversation = Conversation.between(params[:conversation][:sender_id], params[:conversation][:recipient_id])
    if @conversation.present?
      @conversation = @conversation.first
    else
      @conversation = Conversation.create!(conversation_params)
    end
    # debugger
    respond_to do |format|
      format.js
    end
  end

  private
    def conversation_params
      params.require(:conversation).permit(:sender_id, :recipient_id)
    end
end
