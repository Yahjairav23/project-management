class Project < ApplicationRecord

    belongs_to :team 
    has_many :tasks 
    # has_many :creators, through: :tasks, source: :creator 
    # has_many :assignees, through: :tasks, source: :assignee_id 


    def project_count
        
    end
end
