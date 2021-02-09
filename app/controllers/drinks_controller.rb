class DrinksController < ApplicationController
    before '/drinks/*' do
        authetication_required
    end

    get "/drinks" do
        @drink = current_client.drinks
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
        @drink = drink_search
        if @drink.client == current_client
            erb :"/drinks/show.html"
        else
            redirect "/clients/#{current_client.id}"
        end
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

    delete "/drinks/:id" do
        @drink = drink_search
        if @drink.client == current_client
            @drink.destroy
            redirect "/drinks"
        else
            redirect "/clients/#{current_client.id}"
        end
    end





    private

    def has_order
        params[:name] != "" && params[:quantity] != ""
    end

    def create_drink
        Drink.create(name: params[:name], quantity: params[:quantity], category: params[:category], client_id: current_client.id)
    end

    def drink_search
        Drink.find_by(params[:id])
    end

end
