class DrinksController < ApplicationController
    before '/drinks/*' do
        authetication_required
    end

    get "/drinks" do
        @drinks = current_client.drinks
        erb :"/drinks/index.html"
    end
  
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
        @drink = drink_search
        if @drink.client == current_client
            erb :"/drinks/edit.html"
        else
            redirect "/clients/#{current_client.id}"
        end
    end

    patch "/drinks/:id" do
        @drink = drink_search
        @drink.update(name: params[:name], quantity: params[:quantity], category: params[:category])
        redirect "/drinks/#{@drink.id}"
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


    # DELETE: /drinks/5/delete
    delete "/drinks/:id/delete" do
        redirect "/drinks"
    end
end
