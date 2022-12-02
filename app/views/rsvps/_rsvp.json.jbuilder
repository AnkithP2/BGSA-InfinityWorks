# frozen_string_literal: true

json.extract!(rsvp, :id, :user_id, :rsvped, :created_at, :updated_at)
json.url(rsvp_url(rsvp, format: :json))
