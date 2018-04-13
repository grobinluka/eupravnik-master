class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
         
         
  has_many :discussions, dependent: :destroy
  has_many :channels, through: :discussions
  
  has_reputation :votes, source: {reputation: :votes, of: :discussions}, aggregated_by: :sum
end
