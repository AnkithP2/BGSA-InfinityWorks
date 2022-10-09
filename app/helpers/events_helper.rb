module EventsHelper
    def display_attending
        if(@event.attendances.size == 0)
            'None'
        else
            @event.attendances.map(&:userid).join ", "
        end
    end
end
