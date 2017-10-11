class Invention < ActiveRecord::Base

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  belongs_to :inventor
  has_many :invention_categories
  has_many :categories, through: :invention_categories

end
