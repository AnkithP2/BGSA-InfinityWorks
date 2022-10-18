module UsersHelper
    def list_mentors
        if(@user.mentors.size == 0)
            'None'
        else
            @mentors = @user.mentors.map(&:mentor_id) 
            @mentors.each do |p|
                @out = @out.to_s + " " + "#{User.find(p).firstname}"
            end
            return @out
            #@user.mentors.map(&:mentor_id).join ", "
        end
    end

    def list_mentees
        if(@user.mentees.size == 0)
            'None'
        else
            @mentees = @user.mentees.map(&:mentee_id) 
            @mentees.each do |p|
                @out = @out.to_s + " " + "#{User.find(p).firstname}"
            end
            return @out
            #@user.mentees.map(&:mentee_id).join ", "
        end
    end
end
