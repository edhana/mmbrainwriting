require 'sinatra/base'

class BrainwritingApp < Sinatra::Base
  get '/' do
    return "Welcome to Brainwriting Application"
  end

  get '/:idea_name' do
    "Should present the list of ideas"
  end
end
