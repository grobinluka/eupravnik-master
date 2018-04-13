class Channel < ActiveRecord::Base
    
    has_many :discussions
    has_many :users, through: :discussions
    
    validates :channel, presence:true, length: { maximum: 30 } # maximal 1000 chars.
    
end
