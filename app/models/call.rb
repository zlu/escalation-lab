class Call < ActiveRecord::Base
  
  belongs_to :customer
  
  include AASM
  
  aasm_initial_state :arrived
  aasm_column        :state
  aasm_state         :arrived
  aasm_state         :queued
  aasm_state         :answered
  aasm_state         :hungup
  
  aasm_event :queue do
    transitions :to    => :queued, 
                :from  => [:arrived]
  end
  
  aasm_event :answer do
    transitions :to    => :answered, 
                :from  => [:queued]
  end
  
  aasm_event :hangup do
    transitions :to    => :hungup, 
                :from  => [:arrived, :queued, :answered]
  end
  
  # Get all of the calls in queue properly sorted
  def get_queue
    
  end
end
