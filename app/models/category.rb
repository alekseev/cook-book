class Category < ActiveRecord::Base
  has_many :foods
  has_many :existing_foods, :class_name => "Food", :conditions => {:deleted => false} # в основном для вывода в xml
  scope :not_deleted, where(:deleted => false)

  def deleted?
  	self.deleted
  end
end