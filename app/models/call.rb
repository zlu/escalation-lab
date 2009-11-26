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
  
  def self.find_by_queue
    calls = self.find(:all, 
                      :conditions => ['state = ?', 'queued'], 
                      :select => "calls.id, calls.channel, calls.conf_guid, calls.created_at, customers.priority", 
                      :joins => :customer,
                      :order => 'calls.created_at ASC')

    calls.sort! { |a, b| a.created_at <=> b.created_at }
    calls.sort! { |a, b| b.priority <=> a.priority }
    calls
  end
end
