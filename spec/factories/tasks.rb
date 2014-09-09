# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    project_id 1
    sequence(:name) { |n| "Task #{n}" }
    status "unstarted"
    deadline "2014-09-02 20:22:25"
  end
end
