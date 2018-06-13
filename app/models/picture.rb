class Picture < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true
  has_one_attached :file
end
