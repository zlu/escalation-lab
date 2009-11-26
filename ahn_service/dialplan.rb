escalation_lab {
  case extension

  # For calls coming into the system
  when COMPONENTS.escalation_lab['dialing']['main_number']
    create_call(:caller_id => callerid,
                :channel   => channel)
    play 'tt-monkeys'
    
    # Send to a conference muted 'L', with music on hold 'm'
    execute('conference', "#{new_guid}|Lm")

  # For calls headed out to agents
  else
    dial COMPONENTS.escalation_lab['dialing']['prefix'] + 
         extension + 
         COMPONENTS.escalation_lab['dialing']['postfix']

  end
}