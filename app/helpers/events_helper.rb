module EventsHelper
    def display_attended
        if(@event.attendances.size == 0)
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
        if(@event.rsvps.size == 0)
            'None'
        else
            @event.rsvps.size
        end
    end
end
