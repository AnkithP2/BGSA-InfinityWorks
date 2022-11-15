# frozen_string_literal: true

json.extract!(goal, :id, :belongs_to, :goal, :status, :created_at, :updated_at)
json.url(goal_url(goal, format: :json))
