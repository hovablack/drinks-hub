class DrinksController < ApplicationController

  
  
    get "/drinks/new" do
        erb :"/drinks/new.html"
    end
    
    post "/drinks" do
        if has_order
            @drink = create_drink
            redirect "/drinks/#{@drink.id}"
        else
            redirect '/drinks/new'
        end
    end

    get "/drinks/:id" do
        @drinks = drink_search
        erb :"/drinks/show.html"
    end
    
    get "/drinks/:id/edit" do
        erb :"/drinks/edit.html"
    end



    private

    def has_order
        params[:name] != "" && params[:quantity] != ""
    end

    def create_drink
        Drink.create(name: params[:name], quantity: params[:quantity], category: params[:category], client_id: current_client.id)
    end

    def drink_search
        Drink.find(params[:id])
    end






  
  
        # GET: /drinks
    get "/drinks" do
        erb :"/drinks/index.html"
    end

    # GET: /drinks/new

    # POST: /drinks

    # GET: /drinks/5

    # GET: /drinks/5/edit

    # PATCH: /drinks/5
    patch "/drinks/:id" do
        redirect "/drinks/:id"
    end

    # DELETE: /drinks/5/delete
    delete "/drinks/:id/delete" do
        redirect "/drinks"
    end
end
