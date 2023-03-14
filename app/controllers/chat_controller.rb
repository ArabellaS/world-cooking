require_relative '../../lib/wit'
class ChatController < ApplicationController
  def handle_message
    message = params[:message]
    response = handle_wit_message(message)
    raise
    respond_to do |format|
      format.json render message: response
    end
    # Use the response to render a message to the user
  end
end
