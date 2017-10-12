require 'sinatra/base'
require 'pry'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :super_hero
    end

    #
    # get '/team' do
    #   erb :team
    # end


    post '/team' do
      binding.pry
      @team = Team.new(params[:team])
        members = params["team"]["members"]
        @super_heros = members.collect do |member_params|
          SuperHero.new({name: member_params["name"], power: member_params["power"], bio: member_params["bio"]})
        end


      erb :team
    end

end
