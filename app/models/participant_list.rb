class ParticipantList < ActiveRecord::Base
	belongs_to :conversation
	belongs_to :user
end
