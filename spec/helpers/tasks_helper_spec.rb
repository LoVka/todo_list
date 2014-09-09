require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the TasksHelper. For example:
#
# describe TasksHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe TasksHelper, :type => :helper do
  describe "task_state_label_class" do
    it 'returns class "label-primary" for state "started"' do
      expect(helper.task_state_label_class("started")).to eq("label-primary")
    end

    it 'returns class "label-success" for state "compleated"' do
      expect(helper.task_state_label_class("compleated")).to eq("label-success")
    end

    it 'returns class "label-warning" for state "sexpires soon"' do
      expect(helper.task_state_label_class("expires soon")).to eq("label-warning")
    end

    it 'returns class "label-danger" for state "expired"' do
      expect(helper.task_state_label_class("expired")).to eq("label-danger")
    end

    it 'returns class ""label-default" for state "unstarted"' do
      expect(helper.task_state_label_class("unstarted")).to eq("label-default")
    end
  end
end
