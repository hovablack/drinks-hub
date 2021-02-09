class ClientsController < ApplicationController
    
    get '/register' do
        erb :'clients/new.html'
    end

    post "/clients" do
        if valid_input
            @client = Client.create(params)
            session[:client_id] = @client.id
            redirect "/clients/#{@client.id}"
        else
            redirect '/'
        end
    end
    
    get '/login' do
        erb :"/clients/login.html"
    end
    
    post "/login" do
       @client = client_username
       if @client && client.authenticate(params[:password])
           session[:client_id] = @client.id
           redirect "/clients/#{@client.id}"
       else
           redirect '/'
       end
    end

    get "/clients/:id" do
        @client = client_userid
        erb :"/clients/show.html"
    end



    private

    def valid_input
        params[:username] != "" && params[:email] != "" && params[:passowrd] != ""
    end

    def client_userid
        Client.find_by(id: params[:id])
    end

    def client_username
        Client.find_by(username: params[:username])
    end



    # GET: /clients
    get "/clients" do
        erb :"/clients/index.html"
    end

    # GET: /clients/new
    get "/clients/new" do
        erb :"/clients/new.html"
    end

    # POST: /clients

    # GET: /clients/5

    # GET: /clients/5/edit
    get "/clients/:id/edit" do
        erb :"/clients/edit.html"
    end

    # PATCH: /clients/5
    patch "/clients/:id" do
        redirect "/clients/:id"
    end

    # DELETE: /clients/5/delete
    delete "/clients/:id/delete" do
        redirect "/clients"
    end
end
