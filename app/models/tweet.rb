class Tweet < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy
  has_many :tweet_tag_relations, class_name: 'TweetTagRelation', dependent: :destroy
  has_many :tags, through: :tweet_tag_relations, source: :tag
  accepts_nested_attributes_for :tags, allow_destroy: true
end
