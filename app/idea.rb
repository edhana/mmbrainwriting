# idea model
require 'json'
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

  def self.find_by_name(name)
    raise KeyError if @@ideas.empty?

    resp_array = @@ideas.select{ |obj|  obj.name == name }
    if resp_array.size == 0
      return nil
    elsif resp_array.size > 1
      raise RuntimeError("Inconsistency in the unique name for an Idea")
    else
      return resp_array[0]
    end
  end
end
