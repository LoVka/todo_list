require 'rails_helper'

RSpec.describe Task, :type => :model do
  it { should belong_to(:project) }

  it { should validate_presence_of(:project_id) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).scoped_to(:project_id) }
  it { should ensure_inclusion_of(:status).in_array(%w(unstarted started compleated)) }

  context "on create" do
    before do
      create(:task, priority: 1)
      create(:task, priority: 2)
      create(:task, priority: 3)
    end
    subject { create(:task) }

    it "sets priority as maximum priority in project's tasks plus one" do
      expect(subject.priority).to eq 4
    end
  end
end
