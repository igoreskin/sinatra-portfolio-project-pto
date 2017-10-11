class InventionCategory < ActiveRecord::Base

  belongs_to :invention
  belongs_to :category

end
