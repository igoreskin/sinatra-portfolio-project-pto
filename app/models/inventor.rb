class Inventor < ActiveRecord::Base

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  has_secure_password

  has_many :inventions
  has_many :categories, through: :inventions

end
