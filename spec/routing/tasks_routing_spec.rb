require "rails_helper"

RSpec.describe TasksController, :type => :routing do
  describe "routing" do

    it "routes to #create" do
      expect(:post => "/tasks").to route_to("tasks#create")
    end

    it "routes to #update" do
      expect(:put => "/tasks/1").to route_to("tasks#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/tasks/1").to route_to("tasks#destroy", :id => "1")
    end

  end
end
