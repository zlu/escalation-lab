# See http://docs.adhearsion.com for more information on how to write components or
# look at the examples in newly-created projects.

initialization do
  Thread.new do
    loop do

      # First, we monitor for available agents
      agent = nil
      until agents do
        agent = Agent.find_by_state('available', :order => :updated_at)
        sleep COMPONENTS.escalation_lab['intervals']['check_agents']
      end
      ahn_log.agent_available.debug agents
      
      # Once we have an available agent, we then monitor for a call
      queue = nil
      until queue do
        queue = Call.find_by_queue
        sleep COMPONENTS.escalation_lab['intervals']['check_queue']
      end
      ahn_log.call_in_queue.debug queue[0]
                  
      options = { :channel => queue[0].channel,
                  :context => COMPONENTS.escalation_lab['dialing']['context'],
                  :exten   => agent.extension,
                  :priority => COMPONENTS.escalation_lab['dialing']['priority'],
                  :async   => COMPONENTS.search_agents['dialing']['async'] }
      
      begin
        future_resource = Adhearsion::VoIP::Asterisk.manager_interface.send_action_asynchronously 'redirect', options
        queue[0].answered!
      rescue => err
        ahn_log.monitor_thread.error err
        ahn_log.monitor_thread.debug future_resource.response
      end
      
    end
  end
end

methods_for :dialplan do
  def create_call(params)
    customer = Customer.find_by_phone_number(params[:callerid])
    customer.call.create(:channel => params[:channel])
  end
end

methods_for :events do
  def process_event(event)
    case event.name.downcase
    when 'hangup'
      call = Call.find_by_channel(event.headers['Channel'])
      call.hungup!
    end
  end
end
