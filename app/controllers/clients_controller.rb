class ClientsController < ApplicationController
    before '/clients/*' do
        authetication_required
    end
    
    get "/clients" do
        @client = Client.all
        erb :"/clients/index.html"
    end

    get '/register' do
        if logged_in?
            redirect "/clients/#{current_client.id}" 
        else
            erb :'clients/new.html'
        end
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
        if logged_in?
            redirect "/clients/#{current_client.id}"
        else
            erb :"/clients/login.html" 
        end
    end
    
    post "/login" do
       @client = client_username
       if @client && @client.authenticate(params[:password])
           session[:client_id] = @client.id
           redirect "/clients/#{@client.id}"
       else
           redirect '/'
       end
    end

    get "/clients/:id" do
        @client = client_userid
        if @client == current_client
            erb :"/clients/show.html"
        else
            redirect "/clients/#{current_client.id}"
        end
    end

    get "/clients/:id/account" do
        @client = client_userid
        if @client = current_client
            erb :"/clients/edit.html"
        else
            redirect "/clients/#{current_client.id}"
        end
    end

    patch "/clients/:id" do
        @client = client_userid
        @client.update(email: params[:email], password: params[:password])
        redirect "/clients/#{current_client.id}"
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

    # DELETE: /clients/5/delete
    # delete "/clients/:id/delete" do
    #     redirect "/clients"
    # end
end
