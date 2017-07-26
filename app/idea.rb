# idea model
require 'json'
require 'pry'
require 'application_helper'

class Idea
  attr_accessor :name, :childs

  @@ideas = []

  def initialize(name, childs = [])
    raise ArgumentError.new("Invalid Idea Name") unless name.instance_of?(String)

    @name = name
    @childs = childs

    @@ideas << self
  end

  def self.count
    @@ideas.count
  end

  def self.destroy_all
    @@ideas.clear 
  end
end
