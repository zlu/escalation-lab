class Customer < ActiveRecord::Base
  
  has_many :calls
  
  before_create :set_priority
  
  def priority_customer!
    update_attributes!(:priority => 110)
  end
  
  private
  
  # Sets the default priority for all customers
  def set_priority
    self.priority = 100
  end
end
