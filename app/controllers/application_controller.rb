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

    get '/logout' do
        session.clear
        redirect '/'
    end

    get '/about' do
        erb :about
    end

    get '/sponsors/bbabout' do
        erb :'/sponsors/bbabout'
    end
    get '/sponsors/ndabout' do
        erb :'/sponsors/ndabout'
    end
    get '/sponsors/psabout' do
        erb :'/sponsors/psabout'
    end
    get '/sponsors/tcabout' do
        erb :'/sponsors/tcabout'
    end

    helpers do
        
        def logged_in?
            !!current_client
        end

        def current_client
            @current_client ||= Client.find_by(id: session[:client_id])
        end

        def authetication_required
            redirect "/" if !logged_in?
        end
    end

end
