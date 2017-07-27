require 'spec_helper'
require 'idea'
require 'date'

describe Idea do

  before(:each) do
    Idea.destroy_all
  end

  it "instance with only the name" do
    date = Time.now
    expect(Idea.new "Master Mind Meeting").not_to be_nil

    # verify the creation date
    expect(Idea.all.first.created_at.to_i).to be_within(1).of(date.to_i)
    expect(Idea.all.first.updated_at.to_i).to be_within(1).of(date.to_i)
  end

  it "instance with nil name" do
    expect {Idea.new nil}.to raise_error(ArgumentError)
  end

  it "returns the general idea count" do
    Idea.new 'Idea 1'
    expect( Idea.count ).to be == 1
  end

  it "recovered by name" do
    name = 'Idea 1'
    expected_idea = Idea.new(name)
    retrieved_idea = Idea.find_by_name name
    expect(retrieved_idea).to be(expected_idea)
  end

  it "raise error if a search was performed without any saved ideas" do
    expect{Idea.find_by_name("Test name")}.to raise_error(KeyError)
  end

  it "return nil if searched by name with an unknow idea name" do
    name = 'Idea 2'
    Idea.new 'Test name'
    expect(Idea.find_by_name(name)).to be_nil
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
