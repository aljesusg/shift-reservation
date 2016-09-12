require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

RSpec.describe "Shifts", type: :request do
  describe "GET /shift" do
    let(:room) { FactoryGirl.create(:room) }
    let(:shift) { FactoryGirl.create(:shift, room: room) }
    let(:user) { FactoryGirl.create(:user) }
    before { login_as(user, scope: :user) }
    it "#show" do
      get admin_shift_path(shift)
      expect(response).to have_http_status(200)
    end

    it "DESTROY ALL" do
      shift
      expect { get admin_shifts_destroy_all_path }.to change(Shift, :count).from(1).to(0)
    end

    it "returns if there are seats available" do
      expect(shift.sites_available?).to be_truthy
    end

    pending "#edit should show the edit template for shift"
    pending "#update"
  end
end
