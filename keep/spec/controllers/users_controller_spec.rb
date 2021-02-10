require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  subject(:user) { User.create!(username: "Josh", password: "1234567") }

  describe "GET #show" do
    it "renders show template of current user" do
      get :show, params: {id: user.id}

      expect(response).to render_template('show')
      expect(response).to have_http_status(200)
    end

    it "renders new/login when user not signed in" do
      get :show, params: {id: 2}

      expect(response).to render_template('new')
    end
  end


end
