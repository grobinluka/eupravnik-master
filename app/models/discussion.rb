class Discussion < ActiveRecord::Base
    
    belongs_to :channel
    belongs_to :user
    has_many :replies, dependent: :destroy
    
    validates :title, :content, presence: true
    
end
