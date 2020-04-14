class Project < ApplicationRecord

    belongs_to :team 
    has_many :tasks 
    # has_many :creators, through: :tasks, source: :creator 
    # has_many :assignees, through: :tasks, source: :assignee_id 
    validates :name, presence: true 
    validates :start_date, presence: true 
    validates :end_date, presence: true 
    validates :description, presence: true 
    validates :description, length: { minimum: 25 }

    validates :status, presence: true 
    validates :status, acceptance: { accept: ['Planned', 'In Progress', 'Complete'] }

    def project_count
        
    end
end
