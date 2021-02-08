class ApplicationController < Sinatra::Base
    register Sinatra::ActiveRecordExtension

    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "totaldrinks-1t4d3s"
    end

    get "/" do
        erb :welcome
    end

    helpers do
        
        def logged_in?
            !!current_client
        end

        def current_client
            @current_client ||= Client.find_by(id: session[:client_id])
        end
    end

end
