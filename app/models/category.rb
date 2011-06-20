class Category < ActiveRecord::Base
  has_many :foods

  def deleted?
  	self.deleted
  end
end