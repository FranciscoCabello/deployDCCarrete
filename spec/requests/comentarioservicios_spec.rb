require 'rails_helper'

RSpec.describe "Comentarioservicios", type: :request do
  describe "GET /comentarioservicios" do
    it "works! (now write some real specs)" do
      get comentarioservicios_path
      expect(response).to have_http_status(200)
    end
  end
end
