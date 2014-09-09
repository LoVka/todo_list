module TasksHelper
  def task_state_label_class(state)
    case state
      when 'started' then 'label-primary'
      when 'compleated' then 'label-success'
      when 'expires soon' then 'label-warning'
      when 'expired' then 'label-danger'
      else 'label-default'
    end
  end
end
