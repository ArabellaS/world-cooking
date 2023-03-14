class ChatController < ApplicationController
  def handle_message
    message = params[:message]
    response = handle_wit_message(message)
    # Use the response to render a message to the user
  end
end
