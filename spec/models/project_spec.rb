require 'rails_helper'

RSpec.describe Project, :type => :model do
  it { should belong_to(:user) }
  it { should have_many(:tasks) }

  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).scoped_to(:user_id) }
end
