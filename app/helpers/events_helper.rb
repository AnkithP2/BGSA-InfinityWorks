# frozen_string_literal: true

# Helper for events
module EventsHelper
  def display_attended
    if @event.attendances.size.zero?
      'None'
    else
      @event.attendances.size
      #         @event.attendances.map(&:userid)
      #        for id in userIds
      #          userNames += User.id.firstname
      #      end
      #     userNames
    end
  end

  def display_rsvpd
    if @event.rsvps.size.zero?
      'None'
    else
      @event.rsvps.size
    end
  end
end
