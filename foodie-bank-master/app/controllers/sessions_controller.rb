class SessionsController < ApplicationController

    get '/login' do
        erb :"sessions/login.html"
    end

    post '/sessions' do 
        login(params[:email], params[:password])
        redirect '/recipes'
    end

    get '/logout' do 
        if logged_in?
            logout!
            redirect '/login'
        else
            redirect '/signup'
        end
    end
end


