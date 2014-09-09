class Task < ActiveRecord::Base
  belongs_to :project

  validates :name, :project_id, presence: true
  validates :name, uniqueness: { scope: :project_id }
  validates :status, inclusion: %w(unstarted started compleated)

  before_create :set_priority

  default_scope { order('priority DESC') }

  def state
    return 'compleated' if status == 'compleated'
    if deadline && deadline < Time.now
      'expired'
    elsif deadline && deadline < 1.day.since
      'expires soon'
    else
      status
    end
  end

private
  def set_priority
    self.priority = Task.where(project_id: project_id).maximum(:priority).to_i + 1
  end
end
