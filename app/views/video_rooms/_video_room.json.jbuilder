json.extract! video_room, :id, :name, :vonage_session_id, :created_at, :updated_at
json.url video_room_url(video_room, format: :json)
