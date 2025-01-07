class ChatsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def ask
    unless params[:question].present?
      render json: { error: "No question provided" }, status: :bad_request
      return
    end

    answer = chat_with_assistant(params[:question])
    render json: { answer: answer }
  rescue StandardError => e
    Rails.logger.error("Error in chat: #{e.message}")
    render json: { error: "Internal server error" }, status: :internal_server_error
  end

  def privacy
    
  end

  private

  def chat_with_assistant(question)
    response = Pinecone::Assistant::Chat.new.call(question)
    response.dig("message", "content")
  end
end
