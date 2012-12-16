class Bookmark < ActiveRecord::Base
  attr_accessible :url, :tag_list
  acts_as_taggable

  validates :url,:uniqueness=>true
  validates :url, :presence =>true
end
