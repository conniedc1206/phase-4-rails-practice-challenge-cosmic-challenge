class Planet < ApplicationRecord
    # can access the associated missions
    has_many :missions
    # can access the associated scientist
    has_many :scientists, through: :missions
end
