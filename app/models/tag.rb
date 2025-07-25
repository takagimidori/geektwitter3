class Tag < ApplicationRecord
  has_many :tweet_tag_relations, class_name: 'TweetTagRelation', dependent: :destroy
  has_many :tweets, through: :tweet_tag_relations, source: :tag
end
