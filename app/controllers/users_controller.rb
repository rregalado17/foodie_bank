class UsersController < ApplicationController

    get '/signup' do 
        erb :"user/new.html"
    end

    post '/users' do
        @user = User.new
        @user.email = params[:email]
        @user.password = params[:password]
        if @user.save
            redirect '/login'
        else
            erb :"user/new.html"
        end
    end



end

