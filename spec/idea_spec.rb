require 'spec_helper'
require 'idea'

describe Idea do
  before(:each) do
    @idea = Idea.new "Master Mind Meeting"
    @idea.childs << Idea.new("Child 1")
    @idea.childs << Idea.new("Child 2")
  end

  it "creates an idea object with only the name" do
    expect(Idea.new "Master Mind Meeting").not_to be_nil
  end

  it "do not create an idea object with nil name" do
    expect {Idea.new nil}.to raise_error(ArgumentError)
  end

  it "create idea with child ideas" do
    expect(@idea.childs.count).to be 2
  end
end
