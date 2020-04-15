class Comment < ApplicationRecord

        belongs_to :task 
        belongs_to :user 
        validates :comment, presence: true 


end