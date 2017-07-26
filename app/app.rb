require 'sinatra/base'
require 'logger'
require 'application_helper'
require 'idea'

class BrainwritingApp < Sinatra::Base
  configure :production, :development do
  	set :logging, Logger::DEBUG
	end

	configure :test do
  	set :logging, Logger::DEBUG
	end

  get '/' do
    return "<h1>Welcome to Brainwriting Application</h1><b>Main boards count: #{Idea.count}</b>"
  end

  get '/:idea_name' do
    APP_LOGGER.info("Creating new board with name #{params[:idea_name]}")
    idea = nil

    begin
      idea = Idea.new(params[:idea_name])
    rescue ArgumentError =>e
      return 500
    end

    "<h1>Board Title: #{idea.name}</h1> Boards \# #{Idea.count}"
  end
end
