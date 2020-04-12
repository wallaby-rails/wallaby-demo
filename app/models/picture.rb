class Picture < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  has_one_attached :file
end
