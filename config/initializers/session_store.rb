# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_mini_fb_demo_session',
  :secret      => '9012a7213b80afac8ce483bedda9d6f175c155a425e7d9b1efe50b48e0be5af123eb096c38db0bf6ff6542100079258bd222f6f2f2e3bca452dd80cec28ecf08'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
