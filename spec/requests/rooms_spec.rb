require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

RSpec.describe "Rooms", type: :request do
  let(:user) { FactoryGirl.create(:user) }
  before { login_as(user, scope: :user) }
  describe "GET /rooms" do
    let!(:room) { FactoryGirl.create(:room) }
    it "shows rooms index" do
      get admin_rooms_path
      expect(response).to have_http_status(200)
    end
    it "GET room #id" do
      get admin_room_path(room)
      expect(response).to have_http_status(200)
    end
    it "DESTROY ALL rooms" do
      get admin_dashboard_path
      get destroy_all_admin_rooms_path
      expect(Room.count).to be(0)
    end
  end
end
