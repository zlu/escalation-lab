# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_escalationlab_session',
  :secret      => '928b89db05019484afb4dcf5513de0c4132962313d01a4855cd778eda90e1873bf988dcdb76c8b02c3aa7ae90c86283478a208663138585c785dadf06e5500eb'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
