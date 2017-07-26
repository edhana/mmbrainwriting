require 'spec_helper'
require 'idea'

describe Idea do

  before(:each) do
    Idea.destroy_all
  end

  it "instance with only the name" do
    expect(Idea.new "Master Mind Meeting").not_to be_nil
  end

  it "instance with nil name" do
    expect {Idea.new nil}.to raise_error(ArgumentError)
  end

  it "returns the general idea count" do
    Idea.new 'Idea 1'
    expect( Idea.count ).to be == 1
  end

  describe "Idea Childs" do
    before(:each) do
      @idea = Idea.new "Master Mind Meeting"
    end

    it "added one to a default idea instance" do
      @idea.childs << Idea.new("Child 1")
      expect(@idea.childs.count).to be 1 
    end
  end
end
