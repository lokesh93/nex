class Conversation < ActiveRecord::Base
has_many :participant_lists
has_many :users, through: :participant_lists
has_many :messages
end
