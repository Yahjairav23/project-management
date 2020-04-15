class Comment < ApplicationRecord

        belongs_to :task 
        belongs_to :user 
        validates :comment, presence: true 
        validates :comment, length: {minimum: 1, maximum: 250}, allow_blank: false 


end