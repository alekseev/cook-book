class Category < ActiveRecord::Base
  has_many :foods
  scope :not_deleted, where(:deleted => false)

  def deleted?
  	self.deleted
  end
end