class Category < ActiveRecord::Base

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  has_many :invention_categories
  has_many :inventions, through: :invention_categories
  has_many :inventors, through: :inventions

end
