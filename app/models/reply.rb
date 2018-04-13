class Reply < ActiveRecord::Base
    
    belongs_to :discussion
    belongs_to :user
    
    validates :reply_post, presence: true
    
end
