class VideoRoomsController < ApplicationController
  before_action :set_video_room, only: %i[ show edit update destroy ]

  # GET /video_rooms or /video_rooms.json
  def index
    @video_rooms = VideoRoom.all
  end

  # GET /video_rooms/1 or /video_rooms/1.json
  def show
    current_user = User.find_by(id: session[:user_id])
    opentok = OpenTok::OpenTok.new Rails.application.credentials.vonage_api_key, Rails.application.credentials.vonage_api_secret
    @token = opentok.generate_token @video_room.session_id, {name: current_user.first_name}
  end

  # GET /video_rooms/new
  def new
    @video_room = VideoRoom.new
  end

  # GET /video_rooms/1/edit
  def edit
  end

  # POST /video_rooms or /video_rooms.json
  def create
    @video_room = VideoRoom.new(video_room_params)

    respond_to do |format|
      if @video_room.save
        format.html { redirect_to video_room_url(@video_room), notice: "Video room was successfully created." }
        format.json { render :show, status: :created, location: @video_room }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @video_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /video_rooms/1 or /video_rooms/1.json
  def update
    respond_to do |format|
      if @video_room.update(video_room_params)
        format.html { redirect_to video_room_url(@video_room), notice: "Video room was successfully updated." }
        format.json { render :show, status: :ok, location: @video_room }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @video_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /video_rooms/1 or /video_rooms/1.json
  def destroy
    @video_room.destroy

    respond_to do |format|
      format.html { redirect_to video_rooms_url, notice: "Video room was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video_room
      @video_room = VideoRoom.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def video_room_params
      params.require(:video_room).permit(:name, :vonage_session_id)
    end
end
