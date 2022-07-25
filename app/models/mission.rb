class Mission < ApplicationRecord
  # can access the associated scientist
  belongs_to :scientist
  # can access the associated planet
  belongs_to :planet

  # must have a name
  validates :name, presence: true
  # must have a scientist, must not allow a scientist to join the same mission twice
  validates :scientist_id, presence: true, uniqueness: {scope: :name}
  # must have a planet
  validates :planet_id, presence: true
end
