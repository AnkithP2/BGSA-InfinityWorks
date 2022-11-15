# frozen_string_literal: true

# ENABLE ONCE WE DETERMINE WHAT TO DO WITH MENTORS AND MENTEES

# Helper for users
module UsersHelper
  def is_admin
    return true if session[:admin_email]
  end
  '
  def list_mentors
    if @user.mentors.size.zero?
      "None"
    else
      @mentors = @user.mentors.map(&:mentor_id)
      @mentors.each do |p|
        @out = "#{@out} #{User.find(p).firstname}"
      end
      @out
      # @user.mentors.map(&:mentor_id).join ", "
    end
  end

  def list_mentees
    if @user.mentees.size.zero?
      "None"
    else
      @mentees = @user.mentees.map(&:mentee_id)
      @mentees.each do |p|
        @out = "#{@out} #{User.find(p).firstname}"
      end
      @out
      # @user.mentees.map(&:mentee_id).join ", "
    end
  end
  '
end
