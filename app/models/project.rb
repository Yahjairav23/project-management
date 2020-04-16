class Project < ApplicationRecord

    belongs_to :team 
    has_many :tasks 
    accepts_nested_attributes_for :tasks,
        reject_if: Proc.new {|attributes| attributes[:description].blank?}
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
