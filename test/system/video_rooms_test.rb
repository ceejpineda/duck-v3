require "application_system_test_case"

class VideoRoomsTest < ApplicationSystemTestCase
  setup do
    @video_room = video_rooms(:one)
  end

  test "visiting the index" do
    visit video_rooms_url
    assert_selector "h1", text: "Video rooms"
  end

  test "should create video room" do
    visit video_rooms_url
    click_on "New video room"

    fill_in "Name", with: @video_room.name
    fill_in "Vonage session", with: @video_room.vonage_session_id
    click_on "Create Video room"

    assert_text "Video room was successfully created"
    click_on "Back"
  end

  test "should update Video room" do
    visit video_room_url(@video_room)
    click_on "Edit this video room", match: :first

    fill_in "Name", with: @video_room.name
    fill_in "Vonage session", with: @video_room.vonage_session_id
    click_on "Update Video room"

    assert_text "Video room was successfully updated"
    click_on "Back"
  end

  test "should destroy Video room" do
    visit video_room_url(@video_room)
    click_on "Destroy this video room", match: :first

    assert_text "Video room was successfully destroyed"
  end
end
