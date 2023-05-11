class Gossip < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3}
  validates :content, presence: true

  belongs_to :user
  has_many :tags_gossips, class_name: 'TagGossip', dependent: :destroy
  has_many :tags, through: :tags_gossips
  has_many :comments

  before_destroy :destroy_comments_and_tags

  private

  def destroy_comments_and_tags
    self.comments.destroy_all
    self.tags.destroy_all
  end
  
end
