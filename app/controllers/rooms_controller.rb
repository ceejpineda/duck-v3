class RoomsController < ApplicationController
  # before_action :set_room, only: %i[ show edit update destroy ]

  # GET /rooms or /rooms.json
  def index
    @first_room = Room.first
    @first_channel = @first_room.categories.first.channels.first
    if !session[:user_id]
      redirect_to '/users'
    else
      redirect_to "/rooms/#{@first_room.id}/channels/#{@first_channel.id}"
    end
    
    # @current_user = User.find(session[:user_id])
    # @rooms = Room.all
    # @room = Room.new
    # @categories = Room.first.categories
    # @channel = Channel.new
    # @message = Message.new
    # @messages = Channel.find(@categories.first.id).messages
  end

  # GET /rooms/1 or /rooms/1.json
  def show
    @rooms = Room.all
    @categories = Room.find(params[:id]).categories
    if(params[:room_id])
      @message = Message.new
      @messages = Channel.find(params[:id]).messages
    else
      @message = Message.new
      @messages = Room.find(params[:id]).categories.first
      if @messages
        @messages = @messages.channels.first.messages
      else
        @messages = []
      end
    end
    #get the first channel of the first category of the room
    channel_id = @categories.first.channels.first.id
    redirect_to "/rooms/#{params[:id]}/channels/#{channel_id}" 
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms or /rooms.json
  def create
    room_params_clean = room_params.except(:room_id, :channel_id)
    @room = Room.new(room_params_clean)
    #@room = Room.create(name: params["room"]["name"], icon: params["room"]["icon"])
    #broadcast_append_to @room, target: "rooms"
    @rooms = Room.all
    #redirect_to '/'
    respond_to do |format|
      if @room.save
        announcements = Category.create(name: "Important", room_id: @room.id)
        category = Category.create(name: "General", room_id: @room.id)
        announcements.channels.create(name: "Announcements", category_id: category.id)
        category.channels.create(name: "Chat to all", category_id: category.id)
        format.turbo_stream
        format.html { redirect_to "/", notice: "Room was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end
  

  # PATCH/PUT /rooms/1 or /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to room_url(@room), notice: "Room was successfully updated." }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1 or /rooms/1.json
  def destroy
    @room.destroy

    respond_to do |format|
      format.html { redirect_to rooms_url, notice: "Room was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def room_params
      params.require(:room).permit(:name, :icon, :room_id, :channel_id)
    end
end
