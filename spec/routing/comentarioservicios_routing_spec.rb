require "rails_helper"

RSpec.describe ComentarioserviciosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/comentarioservicios").to route_to("comentarioservicios#index")
    end

    it "routes to #new" do
      expect(:get => "/comentarioservicios/new").to route_to("comentarioservicios#new")
    end

    it "routes to #show" do
      expect(:get => "/comentarioservicios/1").to route_to("comentarioservicios#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/comentarioservicios/1/edit").to route_to("comentarioservicios#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/comentarioservicios").to route_to("comentarioservicios#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/comentarioservicios/1").to route_to("comentarioservicios#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/comentarioservicios/1").to route_to("comentarioservicios#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/comentarioservicios/1").to route_to("comentarioservicios#destroy", :id => "1")
    end
  end
end
