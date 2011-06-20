class Food < ActiveRecord::Base
  belongs_to :category
  scope :not_deleted, where(:deleted => false)

  def deleted?
  	self.deleted
  end
end