# frozen_string_literal: true
require 'rails_helper'

RSpec.describe InformationController, type: :controller do
  before do
    user = FactoryGirl.create(:user) # add here
    sign_in(user) # change
  end
  describe "GET #info" do
    it "returns http success" do
      get :info
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #help" do
    it "returns http success" do
      get :help
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #about" do
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
    end
  end
end
