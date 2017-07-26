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
    return "Welcome to Brainwriting Application"
  end

  get '/:idea_name' do
    APP_LOGGER.info("Creating new board with name #{params[:idea_name]}")
    idea = nil

    begin
      idea = Idea.new(params[:idea_name])
    rescue ArgumentError =>e
      return 500
    end

    "<h1>Board Title: #{idea.name}</h1>"
  end
end
