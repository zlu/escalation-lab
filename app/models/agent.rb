class Agent < ActiveRecord::Base

  include AASM
  
  aasm_initial_state :unavailable
  aasm_column        :state
  aasm_state         :unavailable
  aasm_state         :available
  
  aasm_event :start do
    transitions :to    => :available, 
                :from  => [:unavailable]
  end
  
  aasm_event :stop do
    transitions :to    => :unavailable, 
                :from  => [:available]
  end
  
end
