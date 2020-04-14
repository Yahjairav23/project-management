class Task < ApplicationRecord
    belongs_to :project, optional: true
    belongs_to :creator, :class_name => 'User', :foreign_key => 'creator_id'
    belongs_to :assignee, :class_name => 'User', :foreign_key => 'assignee_id', optional: true


    def set_to_complete
        self.status = "Complete"
    end 

    def set_to_in_progress
        self.status = "In Progress"
        redirect_to task_path 
    end 

end
