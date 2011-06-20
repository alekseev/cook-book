class Food < ActiveRecord::Base
  belongs_to :category

  def deleted?
  	self.deleted
  end
end