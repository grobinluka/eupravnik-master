class Discussion < ActiveRecord::Base
    after_initialize :set_defaults
    
    belongs_to :channel
    belongs_to :user
    has_many :replies, dependent: :destroy
    
    validates :title, presence:true, length: { maximum: 50 } # maximal 50 chars.
    validates :content, presence: true, length: { maximum: 1000 } # maximal 1000 chars.
    validates :channel, presence: true
    
    has_reputation :votes, source: :user, aggregated_by: :sum 
    
    def set_defaults
        self.channel = "General" if self.new_record?
    end
end
