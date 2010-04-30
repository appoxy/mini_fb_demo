class SessionsController < ApplicationController

    def create
        puts 'sessions/create'
        p params

        code = params['code'] # Facebooks verification string
        if code
            access_token_hash = MiniFB.oauth_access_token(FB_APP_ID, HOST + "sessions/create", FB_SECRET, code)
            p access_token_hash
            @access_token = access_token_hash["access_token"]
            # TODO: This is where you'd want to store the token in your database
            # but for now, we'll just keep it in the cookie so we don't need a database
            cookies[:access_token] = @access_token
            flash[:success] = "Authentication successful."
        end
        redirect_to :controller => "welcome"
    end
end
