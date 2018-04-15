class Discussion < ActiveRecord::Base
    
    belongs_to :channel
    belongs_to :user
    has_many :replies, dependent: :destroy
    
    validates :title, presence:true, length: { maximum: 50 } # maximal 50 chars.
    validates :content, presence: true, length: { maximum: 1000 } # maximal 1000 chars.
    validates :channel, presence: true
    
    has_reputation :votes, source: :user, aggregated_by: :sum 
    
end
