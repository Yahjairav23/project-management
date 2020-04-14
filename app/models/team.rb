class Team < ApplicationRecord

    has_many :projects, dependent: :destroy
    has_many :users

    validates :name, presence: true, uniqueness: {case_sensitive: false}
    

end
