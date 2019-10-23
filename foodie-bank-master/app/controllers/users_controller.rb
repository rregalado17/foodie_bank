require './config/environment'
require './app/models/user.rb'


class UsersController < ApplicationController
    
    get '/signup' do 
        if !logged_in?
            erb :"users/new.html"
        else
            redirect to '/recipes'
        end
    end

    post '/signup' do
        @user = User.new(params)
        if @user.save && !params[:email].empty? && !params[:password].empty?
            @user.save
            session[:id] = @user.id
            redirect '/recipes'
        else
            redirect '/signup'
        end
    end

    get '/users/:slug' do    
        @user = User.find_by_slug(params[:slug])
        erb :'users/show.html'
    end
end

