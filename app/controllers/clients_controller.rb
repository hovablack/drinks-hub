class ClientsController < ApplicationController
    
    get '/register' do
        erb :'clients/new.html'
    end

    post "/clients" do
        raise params.inspect
    end
    
    get '/login' do
        erb :"/clients/login.html"
    end
    
    post "/login" do
       
        
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
    get "/clients/:id" do
        erb :"/clients/show.html"
    end

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
