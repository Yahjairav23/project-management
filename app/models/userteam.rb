class Userteam < ApplicationRecord
    belongs_to :team
    belongs_to :user
    
    validates :user, uniqueness: {scope: :team, case_sensitive: false}
end
