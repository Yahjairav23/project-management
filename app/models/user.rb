class User < ApplicationRecord
    has_secure_password

    belongs_to :team, optional: true
    
    has_many :created_tasks, :class_name => 'Task', :foreign_key => 'creator_id', dependent: :destroy
    # has_many :creators, through: :created_tasks, source: :creator

    has_many :assigned_tasks, :class_name => 'Task', :foreign_key => 'assignee_id', dependent: :destroy
    # has_many :assignees, through: :assigned_tasks, source: :assignee 
    
    has_many :projects, through: :created_tasks
    has_many :projects, through: :assigned_tasks
    has_many :comments 

    validates :name, presence: true
    validates :age, presence: true
    validates :username, presence: true, uniqueness: {case_sensitive: false}
    


end
