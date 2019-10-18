class RecipesController < ApplicationController

    get '/recipes' do
        "You are logged in as #{session[:email]}"
    end

    get '/recipes/new' do 
        if !logged_in?
            redirect "/login"
        else
            "A new post form"
        end
    end

    get '/recipes/:id/edit' do 
        if !logged_in?
            redirect "/login"
        else
            if recipe = current_user.recipes.find(params[:id])
            "An edit recipe form #{current_user.id} is editing #{recipe.id}"
            else
                redirect '/recipes'
            end
    

        end
    end

end
    
