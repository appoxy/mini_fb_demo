class WelcomeController < ApplicationController

    def index


        @oauth_url = MiniFB.oauth_url(FB_APP_ID, HOST + "sessions/create",
                                      :scope=>MiniFB.scopes.join(","))

    end

    def show
        @id = params[:id]
        @res = MiniFB.get(@access_token, @id, :type=>params[:type], :metadata=>true)
    end

    def post
        @id = params[:id]
        @res = MiniFB.post(@access_token, @id, :type=>params[:type], :metadata=>true)
        redirect_to :action=>"show", :id=>@id
    end

    def fql
        MiniFB.enable_logging
        @res = MiniFB.fql(@access_token, params[:q])
        render :action=>"show"
    end


end
