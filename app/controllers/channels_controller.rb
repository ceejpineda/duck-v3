class ChannelsController < ApplicationController
  before_action :set_channel, only: %i[ show edit update destroy ]

  # GET /channels or /channels.json
  def index
    @channels = Channel.all
    @rooms = Room.all
    @room = Room.new
  end

  # GET /channels/1 or /channels/1.json
  def show
    if !session[:user_id]
      redirect_to '/users'
    else
      @rooms = Room.all
      @room = Room.new
      @categories = Room.find(params[:room_id]).categories
      @channel = Channel.new
      @messages = Channel.find(params[:id]).messages
      @message = Message.new
      @current_user = User.find(session[:user_id])
      @current_room = params[:room_id]
      @current_channel = Channel.find(params[:id])
      render 'rooms/index'
    end
  end

  # GET /channels/new
  def new
    @channel = Channel.new
  end

  # GET /channels/1/edit
  def edit
  end

  # POST /channels or /channels.json
  def create
    @channel = Channel.new(channel_params)

    respond_to do |format|
      if @channel.save
        format.html { redirect_to channel_url(@channel), notice: "Channel was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /channels/1 or /channels/1.json
  def update
    respond_to do |format|
      if @channel.update(channel_params)
        format.html { redirect_to channel_url(@channel), notice: "Channel was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /channels/1 or /channels/1.json
  def destroy
    @channel.destroy

    respond_to do |format|
      format.html { redirect_to channels_url, notice: "Channel was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_channel
      @channel = Channel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def channel_params
      params.require(:channel).permit(:name, :category_id, :room_id, :channel_id)
    end
end
