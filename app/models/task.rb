class Task < ApplicationRecord
    belongs_to :project, optional: true
    belongs_to :creator, :class_name => 'User', :foreign_key => 'creator_id'
    belongs_to :assignee, :class_name => 'User', :foreign_key => 'assignee_id', optional: true
    has_many :comments 

    validates :creator_id, presence: true 
    validates :description, presence: true

    validates :priority, presence: true 
    validates :priority, acceptance: { accept: ['High', 'Medium', 'Low'] }

    validates :status, presence: true 
    validates :status, acceptance: { accept: ['Planned', 'In Progress', 'Complete'] }

    validates :due_date, presence: true 



    #method that udpates the status to COMPLETE, not in use yet
    # def set_project_task_to_complete
    #     self.status = "Complete"
    # end 

    # #method that udpates the status to IN PROGRESS, not in use yet
    # def set_to_in_progress
    #     self.status = "In Progress"
    #     redirect_to task_path 
    # end 

    def completed?
        !date.blank?
    end
    #check if self.status == "Complete"
    #if true print done
    #if false 
end
