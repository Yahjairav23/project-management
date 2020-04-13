class User < ApplicationRecord

    belongs_to :team 
    has_many :created_tasks, :class_name => 'Task', :foreign_key => 'creator_id'
    has_many :assigned_tasks, :class_name => 'Task', :foreign_key => 'assignee_id'
    has_many :projects, through: :tasks 


end
