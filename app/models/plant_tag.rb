class PlantTag < ApplicationRecord
  belongs_to :plant # @plant_tag.plant
  belongs_to :tag
  validates :plant_id, uniqueness: {scope: :tag_id}
end
