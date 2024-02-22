json.extract! branch_history, :id, :name, :effective_date, :end_date, :branch_id, :created_at, :updated_at
json.url branch_history_url(branch_history, format: :json)
