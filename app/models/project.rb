class Project < ApplicationRecord

    belongs_to :team 
    has_many :tasks 
    has_many :users, through: :teams 

end
