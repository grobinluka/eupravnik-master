class Reply < ActiveRecord::Base
    
    belongs_to :discussion
    belongs_to :user
    
    validates :reply_post, presence: true, length: { maximum: 1000 } # maximal 1000 chars.
    
    has_reputation :votes, source: :user, aggregated_by: :sum 
end
