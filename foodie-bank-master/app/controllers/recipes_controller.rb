class RecipesController < ApplicationController

    get '/recipes' do
        if logged_in?
            @user = current_user
            @recipes = current_user.recipes
            erb :"recipes/recipes.html"
        else
            redirect to '/login'
        end
    end

    get '/recipes/new' do 
        if logged_in?
            erb :'recipes/create_recipe.html'
        else 
            redirect to '/login'
        end
    end

    post '/recipes' do
        if logged_in? 
            if params[:title] == ""
                redirect to "/recipes/new"
            else
                @recipe = current_user.recipes.build(title: params[:title], ingredients: params[:ingredients], instructions: params[:instructions])
                if @recipe.save
                    redirect to "/recipes/#{@recipe.id}"
                else
                    redirect to "/recipes/new"
                end
            end
        else 
            redirect to '/login'
        end 
    end

    get '/recipes/:id/edit' do 
        if logged_in?
            @recipe = Recipe.find_by_id(params[:id])
            if @recipe && @recipe.user == current_user
                erb :'recipes/edit_recipe.html'
            else
                redirect to '/recipes'
            end
        else
            redirect to '/login'
        end 
    end
    
    get '/recipes/:id' do 
        if logged_in?
            @recipe = Recipe.find_by(id: params[:id])
            erb :'recipes/show_recipe.html'
        else
            redirect to '/login'
        end 
    end

    patch '/recipes/:id' do 
        @recipe = Recipe.find_by_id(params[:id])
        @recipe.update(title: params[:title], ingredients: params[:ingredients], instructions: params[:instructions])
        if !@recipe.title.empty? || !@recipe.ingredients.empty? || !@recipe.instructions.empty? 
            redirect to "/recipes/#{@recipe.id}"
        else
            redirect to "/shows/#{@recipe.id}/edit"
        end
    end

    delete '/recipes/:id/delete' do
        if logged_in?
            @recipe = Recipe.find_by_id(params[:id])
            if @recipe && @recipe.user == current_user
                @recipe.delete
            end
            redirect to '/recipes'
        else 
            redirect to '/login'
        end 
    end 
end
    
