class Tag < ApplicationRecord
  has_many :tag_gossips, dependent: :destroy
  has_many :gossips, through: :tag_gossips
end
