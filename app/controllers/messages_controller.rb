class MessagesController < ApplicationController
  before_action :set_message, only: %i[ show edit update destroy ]

  # GET /messages or /messages.json
  def index
    @messages = Message.all
  end

  # GET /messages/1 or /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages or /messages.json
  def create
    message_params_clean = message_params.except(:room_id)
    @channel_id = message_params[:channel_id]
    @room_id = message_params[:channel_id]
    message_params_clean[:content] = params[:content]
    puts "channel_id: #{@channel_id}"
    @message = Message.new(message_params_clean)
    if @message.save
      turbo_stream.append "messages_#{params[:channel_id]}", partial: 'partials/message', locals: { message: @message }
    else
      render plain: @message.errors.full_messages
    end
  end

  # PATCH/PUT /messages/1 or /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to message_url(@message), notice: "Message was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1 or /messages/1.json
  def destroy
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url, notice: "Message was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:content, :room_id, :user_id, :channel_id)
    end
end
