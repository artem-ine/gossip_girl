class Gossip < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3, maximum: 14 }
  validates :content, presence: true

  belongs_to :user
  has_many :tags_gossips, class_name: 'TagGossip', dependent: :destroy
  has_many :tags, through: :tags_gossips
  has_many :comments

  before_destroy :delete_comments
  before_destroy :delete_tags

  private

  def delete_comments
    comments.destroy_all
  end

  def delete_tags
    tags.destroy_all
  end
  
end
