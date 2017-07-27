# idea model
require 'json'
require 'application_helper'
require 'date'

class Idea
  attr_accessor :name
  attr_reader :childs, :created_at, :updated_at

  @@ideas = []

  def initialize(name, childs = [])
    raise ArgumentError.new("Invalid Idea Name") unless name.instance_of?(String)

    @name = name
    @childs = childs
    @created_at = Time.now
    @updated_at = Time.now

    @@ideas << self
  end

  def self.all
    return @@ideas.dup
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

  def add_child(child)
    raise ArgumentError unless child.instance_of? Idea

    # set the parent ID (Name)

    # add the Idea to the parent

    # update the date

    return child
  end
end
 
