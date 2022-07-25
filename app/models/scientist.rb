class Scientist < ApplicationRecord
    # can access the associated missions
    has_many :missions, dependent: :destroy
    # can access the associated planets
    has_many :planets, through: :missions

    # must have a name, must have a unique name
    validates :name, presence: true, uniqueness: true
    # must have a field_of_study
    validates :field_of_study, presence: true
end
