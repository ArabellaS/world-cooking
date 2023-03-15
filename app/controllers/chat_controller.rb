require_relative '../../lib/wit'
class ChatController < ApplicationController
  def handle_message
    message = params[:message]
    response = handle_wit_message(message)
    # raise
    respond_to do |format|
      format.text {render partial: 'pages/chat', locals: {message: response}, formats: [:html]}
    end
    # Use the response to render a message to the user
  end
end
