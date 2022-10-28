# frozen_string_literal: true

# Helper for users
module UsersHelper
  def list_mentors
    if @user.mentors.size.zero?
      'None'
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
      'None'
    else
      @mentees = @user.mentees.map(&:mentee_id)
      @mentees.each do |p|
        @out = "#{@out} #{User.find(p).firstname}"
      end
      @out
      # @user.mentees.map(&:mentee_id).join ", "
    end
  end
end
