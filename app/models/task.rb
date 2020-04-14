class Task < ApplicationRecord
    belongs_to :project, optional: true
    belongs_to :creator, :class_name => 'User', :foreign_key => 'creator_id'
    belongs_to :assignee, :class_name => 'User', :foreign_key => 'assignee_id', optional: true


end
