class VideoRoom < ApplicationRecord
    before_create do
      vonage_api_key = "47704571"
      vonage_api_secret = "ebbe6e5bfd47acf7446d4350ec9838ae9983f557"
      opentok = OpenTok::OpenTok.new vonage_api_key, vonage_api_secret
      session = opentok.create_session
      self.vonage_session_id = session.session_id
    end
  end