class VideoRoom < ApplicationRecord
    before_create do
        opentok = OpenTok::OpenTok.new Rails.application.credentials.vonage_api_key, Rails.application.credentials.opentok.vonage_api_secre
        session = opentok.create_session
        self.vonage_session_id = session.session_id
    end
end
