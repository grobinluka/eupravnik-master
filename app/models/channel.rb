class Channel < ActiveRecord::Base
    
    has_many :discussions
    has_many :users, through: :discussions
    
end
