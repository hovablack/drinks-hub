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

end
