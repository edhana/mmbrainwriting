require 'spec_helper'
require 'idea'
require 'pry'

describe BrainwritingApp do
  before(:each) do
    Idea.destroy_all
  end

  it "returns a basic message with the base path /" do
    get "/"
    expect(last_response).to be_ok
    expect(last_response.body.include?("h1")).to be_truthy
  end

  it "create a new board if I post the idea in the basic path" do
    get "/test_board_name"
    expect(last_response).to be_ok
    expect(Idea.count).to be == 1
  end


end
